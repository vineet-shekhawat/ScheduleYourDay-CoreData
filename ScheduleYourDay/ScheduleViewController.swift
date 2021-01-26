//
//  ScheduleViewController.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 02/01/21.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let model = DataHandler.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
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
        headerView.backgroundColor = .systemGreen
        headerView.addSubview(label)
        return headerView
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noOfTaskInSection = 2 //default
        return noOfTaskInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as? ScheduleCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "scheduleCell")
            }
        if indexPath.section == taskTimeline.morning.rawValue {
            cell.task.text = model.morningTask[indexPath.row]
        } else if indexPath.section == taskTimeline.afternoon.rawValue {
            cell.task.text = model.afternoonTask[indexPath.row]
        } else {
            cell.task.text = model.eveTask[indexPath.row]
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height: CGFloat = 60
        return height
    }
    
}
