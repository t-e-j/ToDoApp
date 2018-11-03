
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
//    var toDoTasks : [String] = []
    
    override func viewDidLoad() {
//        toDoTasks.append(Task(taskTitle: "Study for mid-term of Multimedia class",completed: true))
//        toDoTasks.append(Task(taskTitle: "Visit OIP ",completed: false ))
//        toDoTasks.append(Task(taskTitle: "Complete assignment!", completed : true))
        //toDoTasks.append(Task())
        
        let decoder = JSONDecoder()
        
//        print ("Printing complete dictionary")
////        print(Array(UserDefaults.standard.dictionaryRepresentation()))
//        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//            print("\(key) = \(value) \n")
//        }
//
        
        guard let taskDataFromStorage = UserDefaults.standard.object(forKey: "2") as? Data else {
            return
        }
        
        print ("taskDataFromStorage")
        print (taskDataFromStorage)
        
        //        guard let taskFromStorage = try? decoder.decode(Task.self, from: taskDataFromStorage) else {
        //            return
        //        }
        guard let tasksFromStorage = try? decoder.decode(Array<Task>.self, from: taskDataFromStorage) else {
            return
        }
        print ("taskFromStorage")
//        print (taskFromStorage)
        
        toDoTasks = tasksFromStorage
        print ("toDoTasks")
        print (toDoTasks)
        viewOfTable.reloadData()
        
        
//        toDoTasks[index].completed = completed
//        viewOfTable.reloadData()
//        
//        print ("toDoTasks")
//        print (toDoTasks)
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
    
    func newTask(taskTitle: String, completed: Bool) {
//        toDoTasks.append(Task(taskTitle: taskTitle, completed:completed))
//        viewOfTable.reloadData()
        
        
        let myTask = Task(taskTitle:taskTitle, completed:completed)
        
        let encoder = JSONEncoder()
//        let decoder = JSONDecoder()
        
        
        
//        guard let taskDataFromStorage = UserDefaults.standard.object(forKey: "2") as? Data else {
//            return
//        }
//
//        print ("taskDataFromStorage")
//        print (taskDataFromStorage)
//
////        guard let taskFromStorage = try? decoder.decode(Task.self, from: taskDataFromStorage) else {
////            return
////        }
//        guard let taskFromStorage = try? decoder.decode(Task.self, from: taskDataFromStorage) else {
//            return
//        }
//        print ("taskFromStorage")
//        print (taskFromStorage)
//
//        toDoTasks.append(taskFromStorage)
//        print ("toDoTasks")
//        print (toDoTasks)
        
        
        toDoTasks.append(myTask)
        
        
        guard let encoded = try? encoder.encode(toDoTasks) else {
            return
        }
        print ("Encoded!")
        print (encoded)
        
        UserDefaults.standard.set(encoded, forKey:"2")
        
        viewOfTable.reloadData()
    }

    
    func completionOfTask(completed: Bool, index: Int) {
        let encoder = JSONEncoder()
        toDoTasks[index].completed = completed
        
        guard let encoded = try? encoder.encode(toDoTasks) else {
            return
        }
        
        UserDefaults.standard.set(encoded, forKey:"2")
        
        viewOfTable.reloadData()

        print ("toDoTasks")
        print (toDoTasks)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let details = segue.destination as! NewTaskController
        details.delegate = self
    
        
    }
}

