//
//  TasksListViewProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol TasksListViewInput: class {
    func set(viewModel: TasksListViewModel)
    
    func showOnDeleteAlert(
        okAction: @escaping ()->Void,
        cancelAction: @escaping ()->Void
    )
}

protocol TasksListViewOutput: class {
    func loaded()
    func appeared()
    func requestCreateTask()
    func requestConfigureFilter()
}

protocol TasksListView: TasksListViewInput {
    var output: TasksListViewOutput? { get set }
}
