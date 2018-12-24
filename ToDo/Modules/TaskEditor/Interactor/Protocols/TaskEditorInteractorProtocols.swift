//
//  TaskEditorInteractorProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol TaskEditorInteractorInput: class {
    func save()
    func update(status: ToDoStatus)
    func update(dueDate: Date)
    func update(title: String)
    func update(note: String?)
    func getEditableTask() -> ToDoItem
}

protocol TaskEditorInteractorOutput: class {
    func setErrorState()
    func requestToClose()
}
