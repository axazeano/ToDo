//
//  StatusPickerAssembly.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class StatusPickerAssembly {
    func assembly(
        with view: StatusPickerView,
        moduleOutput: StatusPickerModuleOutput,
        selectedStatus: ToDoStatus
    ) {
        let presenter = StatusPickerPresenter()
        let router = StatusPickerRouter(transitionHandler: view)
        
        view.output = presenter
        presenter.view = view
        presenter.moduleOutput = moduleOutput
        presenter.selectedStatus = selectedStatus
        presenter.router = router
    }
}
