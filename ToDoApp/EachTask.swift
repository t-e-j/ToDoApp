//
//  EachTask.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 10/21/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//


import UIKit

protocol TaskCompletion {
    
    func completionOfTask(completed: Bool, index : Int)
}

class EachTask : UITableViewCell {
 
//    var details :String
//    var completed :Bool
//
//    override var description: String{
//        return "details: \(details), completed: \(completed)"
//    }
//
//    init(details: String, completed: Bool) {
//        self.details = details
//        self.completed = completed
//    }
//
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var taskName: UITextView!
    //@IBOutlet weak var taskName: UILabel!
    
    @IBAction func checkBoxClick(_ sender: Any) {
        if tasks![taskNumber!].completed {
            delegate?.completionOfTask(completed: false, index: taskNumber!)
        } else {
            delegate?.completionOfTask(completed: true, index: taskNumber!)
        }

    }
    
   
    var delegate : TaskCompletion?
    var taskNumber : Int?
    var tasks : [Task]?
    
}

//class Task : Codable{
//    var taskTitle :String
//    var completed : Bool
//
//    init (taskTitle: String, completed: Bool){
//        //self.init()
//        self.taskTitle = taskTitle
//        self.completed = completed
//        
//    }
//
//
//}

