//
//  TasksListViewModels.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

struct TasksListItem {
    let title: String
    let status: String
    let note: String?
    let dueDate: String?
    let onTapHandler: ()->Void
}

struct TasksListGroup {
    let title: String
    let items: [TasksListItem]
}

struct TasksListViewModel {
    let groups: [TasksListGroup]
}
