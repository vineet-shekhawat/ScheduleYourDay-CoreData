//
//  TomorrowTask+CoreDataProperties.swift
//  ScheduleYourDay
//
//  Created by vineet singh on 26/01/21.
//
//

import Foundation
import CoreData


extension TomorrowTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TomorrowTask> {
        return NSFetchRequest<TomorrowTask>(entityName: "TomorrowTask")
    }

    @NSManaged public var morning: [BaseTaskPrototype]?
    @NSManaged public var afternoon: [BaseTaskPrototype]?
    @NSManaged public var night: [BaseTaskPrototype]?

}

extension TomorrowTask : Identifiable {

}
