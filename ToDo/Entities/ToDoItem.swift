//
//  ToDoItem.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

struct ToDoItem: Codable, Equatable {
    
    /// Дата создания задачи
    let createAt: Date
    
    /// Дата окончания задачи
    var dueDate: Date
    
    /// Заголовок задачи
    var title: String
    
    /// Дополнительная заметка
    var note: String?
    
    /// Статус задачи
    var status: ToDoStatus
    
    init(
        createAt: Date,
        dueDate: Date,
        title: String,
        note: String?,
        status: ToDoStatus
    ) {
        self.createAt = createAt
        self.dueDate = dueDate
        self.title = title
        self.note = note
        self.status = status
    }
}
