//
//  Task.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 10/31/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import Foundation
import UIKit


class Task : Codable, CustomStringConvertible{
    var taskTitle :String
    var completed : Bool
    
    init (taskTitle: String, completed: Bool){
        //self.init()
        self.taskTitle = taskTitle
        self.completed = completed
        
    }
    
    var description: String{
        return "taskTitle: \(taskTitle), completed: \(completed)"
    }
    
}
