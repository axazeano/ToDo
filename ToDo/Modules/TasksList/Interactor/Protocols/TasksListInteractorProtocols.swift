//
//  TasksListInteractorProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol TasksListInteractorInput: class {
    func requestTasks()
    func remove(task: ToDoItem)
    func setFilter(by status: ToDoStatus)
    func removeFilter()
}

protocol TasksListInteractorOutput: class {
    func set(tasks: [ToDoItem])
    func set(tasks: [ToDoItem], with status: ToDoStatus)
    func setErrorState()
}
