//
//  NextDayViewController.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 02/01/21.
//

import UIKit

class NextDayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let model = DataHandler.shared
    var currentIndex: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addTask(index: IndexPath) {
        let alertController = UIAlertController(title: "ADD TASK", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            self.addField(index: index)
        }
        
        let fav = UIAlertAction(title: "Favorite", style: .default) { _ in
            self.pickerView.isHidden = false
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(add)
        alertController.addAction(fav)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addField(index: IndexPath) {
        let alertController = UIAlertController(title: "ADD TASK", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Enter new task"
        }
        let save = UIAlertAction(title: "Save", style: .default) { (alert) in
            let textfield = alertController.textFields?[0].text
            if let text = textfield {
                if index.section == taskTimeline.morning.rawValue {
                    self.model.nextMorningTask[index.row] = text
                } else if index.section == taskTimeline.afternoon.rawValue {
                    self.model.nextAfternoonTask[index.row] = text
                } else {
                    self.model.nextEveTask[index.row] = text
                }
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tsize = tableView.frame.size
        let label = UILabel(frame: CGRect(x: tsize.width / 4, y: 10, width: tsize.width/2, height: 40))
        label.text = model.sections[section]
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tsize.height, height: tsize.width))
        headerView.backgroundColor = .systemOrange
        headerView.addSubview(label)
        return headerView
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noOfTaskInSection = 2 //default
        return noOfTaskInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NextDayCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
        if indexPath.section == taskTimeline.morning.rawValue {
            cell.addTaskLabel.text = model.nextMorningTask[indexPath.row]
        } else if indexPath.section == taskTimeline.afternoon.rawValue {
            cell.addTaskLabel.text = model.nextAfternoonTask[indexPath.row]
        } else {
            cell.addTaskLabel.text = model.nextEveTask[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height: CGFloat = 60
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.addTask(index: indexPath)
        self.currentIndex = indexPath
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == taskTimeline.morning.rawValue {
                model.nextMorningTask[indexPath.row] = "No Task"
            } else if indexPath.section == taskTimeline.afternoon.rawValue {
                model.nextAfternoonTask[indexPath.row] = "No Task"
            } else {
                model.nextEveTask[indexPath.row] = "No Task"
            }
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}

extension NextDayViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.model.favTask?.count ?? 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.model.favTask?[row].task
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let index = self.currentIndex {
            if index.section == taskTimeline.morning.rawValue {
                guard let task = self.model.favTask?[row].task else { return }
                model.nextMorningTask[index.row] = task
            } else if index.section == taskTimeline.afternoon.rawValue {
                guard let task = self.model.favTask?[row].task else { return }
                model.nextAfternoonTask[index.row] = task
            } else {
                guard let task = self.model.favTask?[row].task else { return }
                model.nextEveTask[index.row] = task
            }
            self.pickerView.isHidden = true
            self.tableView.reloadRows(at: [index], with: .none)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        let heightForRow: CGFloat = 30
        return heightForRow
    }
}
