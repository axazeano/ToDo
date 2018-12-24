//
//  TaskEditorViewModels.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

struct TaskEditorViewModel {
    let title: String?
    let status: String
    let note: String?
    let dueDate: String
    
    let onTitleChange: (String?)->Void
    let onNoteChange: (String?)->Void
    let onStatusPress: ()->Void
    let onDueDatePress: ()->Void
    let onTaskDelete: (()->Void)?
}
