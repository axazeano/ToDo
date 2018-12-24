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
    private let storeService: StoreService
    
    init(openedTask: ToDoItem?, storeService: StoreService) {
        self.openedTask = openedTask
        self.storeService = storeService
    }
}

extension TaskEditorInteractor: TaskEditorInteractorInput {
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
    
    func getOpenedTask() -> ToDoItem? {
        return openedTask
    }
    
}
