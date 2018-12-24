//
//  TasksListRouter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class TasksListRouter {
    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func showAddTask() {
        let addTaskView = TaskEditorViewController(style: .grouped)
        TaskEditorAssembly().assembly(with: addTaskView)
        transitionHandler?.pushModule(with: addTaskView, animated: true)
    }
}
