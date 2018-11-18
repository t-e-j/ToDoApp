//
//  MainTabBarController.swift
//  ToDoApp
//
//  Created by Tejasvi Belsare on 11/8/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit

class TaskManager {
    var tasks: [Task] = []
    
    static let shared: TaskManager = TaskManager()
}

class MainTabBarController: UITabBarController {
    
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}
