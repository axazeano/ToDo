//
//  StatusPickerModuleProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol StatusPickerModuleOutput: class {
    func set(status: ToDoStatus?)
}
