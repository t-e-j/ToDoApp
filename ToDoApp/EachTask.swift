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
 
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var taskName: UILabel!
    
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

class Task :UITableViewController{
    var taskTitle = ""
    var completed = false
    
    convenience init (taskTitle: String){
        self.init()
        self.taskTitle = taskTitle
    }
}

