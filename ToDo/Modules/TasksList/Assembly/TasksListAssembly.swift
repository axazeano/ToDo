//
//  TasksListAssembly.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class TasksListAssembly {
    func assembly(with view: TasksListView) {
        
        let presenter = TaskListPresenter()
        let interactor = TasksListInteractor(
            storeService: InMemoryStoreService.shared
        )
        
        let router = TasksListRouter(transitionHandler: view)
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
    }
}
