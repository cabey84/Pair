//
//  StudentTableListTableViewController.swift
//  Pair
//
//  Created by Chandi Abey  on 10/7/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class StudentTableListTableViewController: UITableViewController {

    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

  
    //MARK: - AlertController
    
    func showAlert() {
        var studentTextField: UITextField?
        //initialze a UIAlertController
        let alertController = UIAlertController(title: "Add Student", message: "Please add student to group project list", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            //give properties to the AlertController
            textField.placeholder = "Enter student name here"
            textField.keyboardType = .NumberPad
            
            studentTextField = textField
        }
        
        //create actions- cancel and add
        let addStudentAction = UIAlertAction(title: "Add", style: .Default) { (UIAlertAction) in
            guard let studentNameText = studentTextField?.text else { return}
            StudentController.sharedController.addStudent(studentNameText, idea: "Think of an idea")
        
        }
        let cancelStudentAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in
            
        }
        
        //add created actions
        alertController.addAction(addStudentAction)
        alertController.addAction(cancelStudentAction)
        
        //present the actual alert
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func addItemButtonTapped(sender: AnyObject) {
        showAlert()
        tableView.reloadData()
    }
    
    @IBAction func buttonCellButtonTapped(sender: AnyObject) {
        //find the cell selected by the user
        StudentController.sharedController.randomizeArray()
        
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)
        let student = StudentController.sharedController.studentsToDisplay[indexPath.row]
        cell.textLabel?.text = student.name
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let student = StudentController.sharedController.studentsToDisplay[indexPath.row]
            StudentController.sharedController.removeStudent(student)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
   
}