//
//  DataHandler.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 07/01/21.
//

import Foundation
import UIKit

enum taskTimeline: Int {
    case morning
    case afternoon
    case evening
}

final class DataHandler: NSObject {
    
    static let shared = DataHandler()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var morningTask = ["coffee", "workout"]
    var afternoonTask = ["lunch", "meeting"]
    var eveTask = ["jogg", "date"]
    
    var nextMorningTask = ["No task", "No task"]
    var nextAfternoonTask = ["No task", "No task"]
    var nextEveTask = ["No task", "No task"]
    
    var sections = ["Morning", "Afternoon", "Evening"]
    
    var favTask: [FavTask]?
    
    private override init() {
        super.init()
        self.fetchFavTask()
    }
    
    func fetchFavTask() -> Bool {
        do {
            self.favTask = try self.context.fetch(FavTask.fetchRequest())
            return true
        } catch {
            print("error while fetching Favourite tasks")
            return false
        }
    }
    
}
