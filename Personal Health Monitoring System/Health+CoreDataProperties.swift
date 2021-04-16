//
//  Health+CoreDataProperties.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/15/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//
//

import Foundation
import CoreData


extension Health {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Health> {
        return NSFetchRequest<Health>(entityName: "Health")
    }

    @NSManaged public var systolicBloodPressure: Int64
    @NSManaged public var diostolicBloodPressure: Int64
    @NSManaged public var weight: Int64
    @NSManaged public var sugarLevel: Int64
    @NSManaged public var other: String?

}
