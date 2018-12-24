//
//  ShareDataService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol ShareDataService: class {
    func share(items: [ToDoItem])
    func load() -> [ToDoItem]?
}
