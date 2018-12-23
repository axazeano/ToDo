//
//  TasksListInteractorProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol TasksListInteractorInput: class {
    func requestTasks()
    func requestTasks(with status: ToDoStatus)
    func remove(task: ToDoItem)
}

protocol TasksListInteractorOutput: class {
    func set(tasks: [ToDoItem])
    func set(tasks: [ToDoItem], with status: ToDoStatus)
    func set(error: Error)
}
