//
//  TaskEditorAssembly.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class TaskEditorAssembly {
    func assembly(with view: TaskEditorView, openedTask: ToDoItem? = nil) {
        let presenter = TaskEditorPresenter()
        let interactor = TaskEditorInteractor(
            openedTask: openedTask,
            storeService: InMemoryStoreService()
        )
        view.output = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.output = presenter
    }
}
