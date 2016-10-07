//
//  StudentController.swift
//  Pair
//
//  Created by Chandi Abey  on 10/7/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import CoreData
import GameKit

class StudentController {
    
    //create a singleton
    static let sharedController = StudentController()
    
    //create an array to hold the list of students to display in the table view controller
    var studentsToDisplay: [Student] = [ ]
    
    //create a computed property to hold retrieve the fetched students 
    
    var fetchedStudentsFromCoreData: [Student] {
        //create an NS fetch request
        let request = NSFetchRequest(entityName: "Student")
        //where to get the student from, the moc
        let moc = Stack.sharedStack.managedObjectContext
        //items will come back as a managed object, needs to be converted into type Student
        return (try? moc.executeFetchRequest(request)) as? [Student] ?? [ ]
    }
    
    //create a function to add students. This will be called in the tableViewController UIAlert
    func addStudent(name: String, idea: String) {
        _ = Student(name: name, idea: idea)
        saveToPersistentStore()
    }
    
    //create a function to remove students which will be called in the commitToEditing function in the tableViewController
    func removeStudent(student: Student) {
        if let moc = student.managedObjectContext {
            moc.deleteObject(student)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            fatalError("There was a problem saving to persistent store")
        }
        
    }
    
    //create function to randomize the array of students received. This will be called when the randomize button is pressed in the list tableViewController. 
    func randomizeArray() {
        studentsToDisplay = fetchedStudentsFromCoreData
        GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(studentsToDisplay)
    }
    
    
}