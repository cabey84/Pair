//
//  Student+CoreDataProperties.swift
//  Pair
//
//  Created by Chandi Abey  on 10/7/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var name: String
    @NSManaged var idea: String

}
