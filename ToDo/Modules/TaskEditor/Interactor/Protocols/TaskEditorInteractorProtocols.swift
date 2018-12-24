//
//  TaskEditorInteractorProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol TaskEditorInteractorInput: class {
    func save(task: ToDoItem)
    func getOpenedTask() -> ToDoItem?
}

protocol TaskEditorInteractorOutput: class {
    func set(task: ToDoItem)
    func setErrorState()
    func requestToClose()
}
