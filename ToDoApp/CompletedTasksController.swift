//
//  CompletedTasksController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 11/3/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

class CompletedTasksController : UITableViewController {
    
//    var completedTasksArray :[Task]?
    var completedTasksArray :[Task]=[]
    var item :Task?
    
    
    @IBOutlet var ViewOfCompletedTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        for item in TaskManager.shared.tasks
        {
//            print (item)
            if item.completed == true {
//                completedTasksArray.append(item)
                completedTasksArray.append(item)
                print (item)
            }
        
        }
    }
    
    override func viewDidLoad() {

        ViewOfCompletedTable.delegate = self
        ViewOfCompletedTable.reloadData()
        
//        TaskManager.shared.tasks = completedTasksArray

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasksArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let eachCell = UITableViewCell()
        let content = completedTasksArray[indexPath.row]
        print ("printing content")
        print (content)


        eachCell.textLabel?.text = content.taskTitle
        return eachCell

    }

}
