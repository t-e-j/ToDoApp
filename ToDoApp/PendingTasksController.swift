//
//  PendingTasksController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 11/3/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

class PendingTasksController : UITableViewController {
    
    var pendingTasksArray :[Task]=[]
    var item :Task?
    
    
    @IBOutlet var ViewOfPendingTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for item in TaskManager.shared.tasks
        {
            //            print (item)
            if item.completed == false {

                pendingTasksArray.append(item)
                print (item)
            }
            
        }
    }
    
    override func viewDidLoad() {
        
        ViewOfPendingTable.delegate = self
        ViewOfPendingTable.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingTasksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eachCell = UITableViewCell()
        let content = pendingTasksArray[indexPath.row]
        print ("printing content")
        print (content)
        
        
        eachCell.textLabel?.text = content.taskTitle
        return eachCell
        
    }
    
}
