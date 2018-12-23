//
//  TaskEditorViewModels.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

struct TaskEditorViewModel {
    let createdAt: String
    let title: String
    let status: String
    let note: String?
    let dueDate: String?
    
    let onStatusPress: ()->Void
    let onDueDatePress: ()->Void
}
