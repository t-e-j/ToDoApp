
//
//  MainPageViewController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 10/21/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit


class MainPageViewController: UITableViewController, NewTask, TaskCompletion {

    //    UITableViewDelegate,UITableViewDataSource
    
    
    @IBOutlet var viewOfTable: UITableView!
    var toDoTasks : [Task]=[]
    
    override func viewDidLoad() {
        toDoTasks.append(Task(taskTitle: "Study for mid-term of Multimedia class"))
        toDoTasks.append(Task(taskTitle: "Visit OIP "))
        toDoTasks.append(Task(taskTitle: "Complete assignment!"))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eachCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! EachTask
        let checked50 = UIImage(named:"checked50")!
        let unchecked50 = UIImage(named: "unchecked50")!
        
        eachCell.taskName.text = toDoTasks[indexPath.row].taskTitle

        if toDoTasks[indexPath.row].completed{
            eachCell.checkBox.setBackgroundImage(checked50, for: UIControl.State.normal)

        }
        else {
            eachCell.checkBox.setBackgroundImage(unchecked50, for: UIControl.State.normal)
            
        }
        
        eachCell.delegate = self
        eachCell.taskNumber = indexPath.row
        eachCell.tasks = toDoTasks
        
        
        return eachCell
    }
    
    func newTask(taskTitle: String) {
        toDoTasks.append(Task(taskTitle: taskTitle))
        viewOfTable.reloadData()
    }
    
    
    func completionOfTask(completed: Bool, index: Int) {
        toDoTasks[index].completed = completed
        viewOfTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let details = segue.destination as! NewTaskController
        details.delegate = self
        
    }
}

