//
//  TaskEditorInteractor.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation


final class TaskEditorInteractor {
    weak var output: TaskEditorInteractorOutput?
    private var openedTask: ToDoItem?
    private var editableTask: ToDoItem
    private let storeService: StoreService
    
    init(openedTask: ToDoItem?, storeService: StoreService) {
        self.openedTask = openedTask
        self.storeService = storeService
        if let openedTask = openedTask {
            editableTask = openedTask
        } else {
            editableTask = ToDoItem(
                createAt: Date(),
                dueDate: Date(),
                title: "",
                note: nil,
                status: .new
            )
        }
    }
}

extension TaskEditorInteractor: TaskEditorInteractorInput {
    func update(status: ToDoStatus) {
        editableTask.status = status
    }
    
    func update(dueDate: Date) {
        editableTask.dueDate = dueDate
    }
    
    func update(title: String) {
        editableTask.title = title
    }
    
    func update(note: String?) {
        editableTask.note = note
    }
    
    func getEditableTask() -> ToDoItem {
        return editableTask
    }
    
    func save(task: ToDoItem) {
        if let openedTask = openedTask {
            storeService.replace(
                oldItem: openedTask,
                with: task,
                onSuccess: { [weak self] (_) in
                    self?.output?.requestToClose()
                },
                onFailure: { [weak self] (_) in
                    self?.output?.setErrorState()
                }
            )
        } else {
            storeService.add(
                item: task,
                onSuccess: { [weak self] (_) in
                    self?.output?.requestToClose()
                },
                onFailure: { [weak self ] (_) in
                    self?.output?.setErrorState()
                }
            )
        }
    }
}
