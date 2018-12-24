//
//  TaskEditorViewProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol TaskEditorViewInput: class {
    func set(viewModel: TaskEditorViewModel)
    func showDatePicker()
    func showDeleteAlert()
}

protocol TaskEditorViewOutput: class {
    func loaded()
    func requestSaveChanges(
        title: String?,
        status: String?,
        note: String?,
        dueDate: String?
    )
    
    func requestExit()
    func requestDeleteTask()
}

protocol TaskEditorView: TaskEditorViewInput {
    var output: TaskEditorViewOutput? { get set }
}
