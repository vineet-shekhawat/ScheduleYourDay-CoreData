//
//  DataHandler.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 07/01/21.
//

import Foundation

enum taskTimeline: Int {
    case morning
    case afternoon
    case evening
}

final class DataHandler {
    
    static let shared = DataHandler()
    
    var morningTask = ["coffee", "workout"]
    var afternoonTask = ["lunch", "meeting"]
    var eveTask = ["jogg", "date"]
    
    var nextMorningTask = ["No task", "No task"]
    var nextAfternoonTask = ["No task", "No task"]
    var nextEveTask = ["No task", "No task"]
    
    var sections = ["Morning", "Afternoon", "Evening"]
    
    var favTask = ["Task1", "Task2", "Task3", "Task4"]
    
    private init() {
        //init
    }
}
