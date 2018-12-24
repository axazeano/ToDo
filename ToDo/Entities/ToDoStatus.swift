//
//  ToDoStatus.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

enum ToDoStatus: String, Codable, CaseIterable {
    case new = "new"
    case inProgress = "inProgress"
    case completed = "completed"
    
    var name: String {
        switch self {
        case .new: return "Новая"
        case .inProgress: return "В процессе"
        case .completed: return "Завершенная"
        }
    }
    
}
