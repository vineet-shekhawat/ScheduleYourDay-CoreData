//
//  TodayTask+CoreDataProperties.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 26/01/21.
//
//

import Foundation
import CoreData


extension TodayTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodayTask> {
        return NSFetchRequest<TodayTask>(entityName: "TodayTask")
    }

    @NSManaged public var morning: [BaseTaskPrototype]?
    @NSManaged public var afternoon: [BaseTaskPrototype]?
    @NSManaged public var evening: [BaseTaskPrototype]?

}

extension TodayTask : Identifiable {

}
