//
//  BaseTaskPrototype.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 26/01/21.
//

import Foundation

public final class BaseTaskPrototype: NSObject {
    let taskName: String?
    var status: String?
    
    init(task: String, status: String) {
        self.taskName = task
        self.status = status
    }
    
    convenience init(task: String) {
        self.init(task: task, status: "upcoming")
    }
}
