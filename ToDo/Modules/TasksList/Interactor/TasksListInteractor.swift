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
    var storeService: StoreService
    
    init(storeService: StoreService) {
        self.storeService = storeService
    }
}

extension TasksListInteractor: TasksListInteractorInput {
    func requestTasks() {
        storeService.loadItems(
            onSuccess: { [weak self] (tasks) in
                self?.output?.set(tasks: tasks)
            }) { (error) in
                print(error)
            }
    }
    
    func requestTasks(with status: ToDoStatus) {
        storeService.loadItems(
            onSuccess: { [weak self] (tasks) in
                self?.output?.set(
                    tasks: tasks.filter { $0.status == status },
                    with: status
                )
        }) { (error) in
            print(error)
        }
    }
    
    func remove(task: ToDoItem) {
        storeService.remove(
            item: task,
            onSuccess: {
                
        }) { (error) in
            
        }
    }
}
