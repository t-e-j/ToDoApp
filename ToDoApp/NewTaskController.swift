//
//  NewTaskController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 10/21/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

protocol NewTask {
    func newTask(taskTitle: String)
}

class NewTaskController : UIViewController {
    
    
    @IBOutlet weak var newTaskDetails: UITextField!
    
    
    @IBAction func addNewTask(_ sender: Any) {
        if newTaskDetails.text != ""{
            delegate?.newTask(taskTitle: newTaskDetails.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    var delegate: NewTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
