//
//  TasksListInteractor.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class TasksListInteractor {
    weak var output: TasksListInteractorOutput?
    private let storeService: StoreService
    private var filterByStatus: ToDoStatus?
    
    init(storeService: StoreService) {
        self.storeService = storeService
    }
}

extension TasksListInteractor: TasksListInteractorInput {
    func requestTasks() {
        storeService.loadItems(
            onSuccess: { [weak self] (tasks) in
                self?.handle(tasks: tasks)
            },
            onFailure: { [weak self] (_) in
                self?.output?.setErrorState()
            }
        )
    }
    
    func remove(task: ToDoItem) {
        storeService.remove(
            item: task,
            onSuccess: { [weak self] (tasks) in
                self?.handle(tasks: tasks)
            },
            onFailure: { [weak self] (_) in
                self?.output?.setErrorState()
            }
        )
    }
    
    func handle(tasks: [ToDoItem]) {
        if let status = filterByStatus {
            output?.set(
                tasks: tasks.filter { $0.status == status },
                with: status
            )
        } else {
            output?.set(tasks: tasks)
        }
    }
    
    func setFilter(by status: ToDoStatus) {
        self.filterByStatus = status
    }
    
    func removeFilter() {
        self.filterByStatus = nil
    }
}
