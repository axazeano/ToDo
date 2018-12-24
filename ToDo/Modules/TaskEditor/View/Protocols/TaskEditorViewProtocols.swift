//
//  TaskEditorViewProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol TaskEditorViewInput: class {
    func set(viewModel: TaskEditorViewModel)
    func showDeleteAlert()
}

protocol TaskEditorViewOutput: class {
    func loaded()
    func requestSaveChanges()
    
    func requestExit()
    func requestDeleteTask()
}

protocol TaskEditorView: TaskEditorViewInput, TransitionHandler {
    var output: TaskEditorViewOutput? { get set }
}
