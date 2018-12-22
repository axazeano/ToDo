//
//  ToDoItem.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    
    /// Дата создания задачи
    let createAt: Date
    
    /// Дата окончания задачи
    var dueDate: Date?
    
    /// Заголовок задачи
    var title: String
    
    /// Истек ли срок выполнения задачи?
    var isExpired: Bool
    
    /// Дополнительная заметка
    var note: String?
    
    /// Статус задачи
    var status: ToDoStatus
}
