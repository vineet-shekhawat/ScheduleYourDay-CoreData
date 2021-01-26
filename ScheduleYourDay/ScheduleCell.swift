//
//  ScheduleCell.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 02/01/21.
//

import UIKit

class ScheduleCell: UITableViewCell {

    @IBOutlet weak var task: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var status: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.doneBtn.setImage(UIImage(systemName: "checkmark.circle"), for: [.selected])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func taskCompleted(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            self.status.text = "Done"
        } else {
            self.status.text = "Missed"
        }
    }
    
}
