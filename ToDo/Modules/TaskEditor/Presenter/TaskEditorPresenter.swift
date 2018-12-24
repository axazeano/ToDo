//
//  TaskEditorPresenter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

class TaskEditorPresenter {
    weak var view: TaskEditorView?
    var interactor: TaskEditorInteractorInput?
    var router: TaskEditorRouter?
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "d MMMM yyyy"
    }
}

extension TaskEditorPresenter: TaskEditorViewOutput {
    func requestSaveChanges(title: String?, note: String?) {
        
    }
    
    func loaded() {
        updateViewModel()
    }
    
    func requestSaveChanges() {
        interactor?.save()
    }
    
    func requestExit() {
        
    }
    
    func requestDeleteTask() {
        
    }
    
    private func updateViewModel() {
        guard let oppenedTask = interactor?.getEditableTask() else {
            return
        }
        
        view?.set(
            viewModel: getViewModelFromTask(oppenedTask)
        )
    }
    
    private func getViewModelFromTask(_ task: ToDoItem) -> TaskEditorViewModel {
        return TaskEditorViewModel(
            title: task.title,
            status: task.status.rawValue,
            note: task.note,
            dueDate: dateFormatter.string(from: task.dueDate),
            onTitleChange: { [weak self] (title) in
                self?.interactor?.update(title: title ?? "")
                self?.updateViewModel()
            },
            onNoteChange: { [weak self] (note) in
                self?.interactor?.update(note: note)
                self?.updateViewModel()
            },
            onStatusPress: { [weak self] in
                guard let `self` = self else {
                    return
                }
                self.router?.showStatusPicker(
                    selectedStatus: task.status,
                    statusPickerOutput: self
                )
            },
            onDueDatePress: {
                self.router?.showDatePicker(
                    lowBoundaryDate: Date(),
                    onAccept: { [weak self] (selectedDate) in
                        self?.interactor?.update(dueDate: selectedDate)
                        self?.updateViewModel()
                    }
                )
            }
        )
    }
    
}

extension TaskEditorPresenter: TaskEditorInteractorOutput {
    func setErrorState() {
        
    }
    
    func requestToClose() {
        router?.close()
    }
}

extension TaskEditorPresenter: StatusPickerModuleOutput {
    func set(status: ToDoStatus?) {
        interactor?.update(status: status!)
        updateViewModel()
    }
    
    
}
