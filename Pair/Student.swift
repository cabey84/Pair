//
//  Student.swift
//  Pair
//
//  Created by Chandi Abey  on 10/7/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import CoreData


class Student: NSManagedObject {

// add a convenience initializer to initialize the managed object context 
    
    convenience init?(name: String, idea: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Student", inManagedObjectContext: context) else { return nil }
        
        //initialize entity and context to find where we are in core data
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        //initialize other properties
        self.name = name
        self.idea = idea
    }

}
