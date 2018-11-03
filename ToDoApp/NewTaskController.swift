//
//  NewTaskController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 10/21/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

protocol NewTask {
    func newTask(taskTitle: String, completed : Bool)
}

class NewTaskController : UIViewController {
    
    
    @IBOutlet weak var newTaskDetails: UITextField!
    
    
    @IBAction func addNewTask(_ sender: Any) {
        if newTaskDetails.text != ""{
            delegate?.newTask(taskTitle: newTaskDetails.text!, completed : false)
            navigationController?.popViewController(animated: true)
        }
    }
    
    var delegate: NewTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func newTask(taskTitle: String, completed: Bool) {
//        let myTask = Task(taskTitle:taskTitle, completed:completed)
//        
//        let encoder = JSONEncoder()
//        let decoder = JSONDecoder()
//        
//        guard let encoded = try? encoder.encode(myTask) else {
//            return
//        }
//        
//        print (encoded)
//        
//        UserDefaults.standard.set(encoded, forKey:"2")
//        
//        guard let taskDataFromStorage = UserDefaults.standard.object(forKey: "2") as? Data else {
//            return
//        }
//        
//        print (taskDataFromStorage)
//        
//        guard let taskFromStorage = try? decoder.decode(Task.self, from: taskDataFromStorage) else {
//            return
//        }
//        
//        print (taskFromStorage)
//        
//    }
}




//class Task: Codable, CustomStringConvertible {
//    var taskTitle : String
//    var completed : Bool
//
//    init(taskTitle: String, completed: Bool) {
//        self.taskTitle = taskTitle
//        self.completed = completed
//    }
//
//    var description: String{
//        return "taskTitle: \(taskTitle), completed: \(completed)"
//    }
//
//}
