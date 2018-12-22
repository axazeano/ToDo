//
//  ToDoStatus.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

enum ToDoStatus: String, Codable {
    case new = "new"
    case inProgress = "inProgress"
    case completed = "completed"
}
