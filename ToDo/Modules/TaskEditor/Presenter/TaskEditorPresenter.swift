//
//  TaskEditorPresenter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

class TaskEditorPresenter {
    weak var view: TaskEditorView?
    var interactor: TaskEditorInteractorInput?
}

extension TaskEditorPresenter: TaskEditorViewOutput {
    func requestSaveChanges(title: String?, note: String?) {
        
    }
    
    func loaded() {
        guard let oppenedTask = interactor?.getEditableTask() else {
            return
        }
        
        view?.set(
            viewModel: getViewModelFromTask(oppenedTask)
        )
    }
    
    func requestSaveChanges() {
        
    }
    
    func requestExit() {
        
    }
    
    func requestDeleteTask() {
        
    }
    
    private func getViewModelFromTask(_ task: ToDoItem) -> TaskEditorViewModel {
        return TaskEditorViewModel(
            title: task.title,
            status: task.status.rawValue,
            note: task.note,
            dueDate: "date",
            onStatusPress: {
                
            },
            onDueDatePress: {
                
            }
        )
    }
    
}

extension TaskEditorPresenter: TaskEditorInteractorOutput {
    func setErrorState() {
        
    }
    
    func requestToClose() {
        
    }
    
    
}
