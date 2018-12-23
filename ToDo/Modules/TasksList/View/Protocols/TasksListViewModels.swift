//
//  TasksListViewModels.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

struct TasksListItem {
    let title: String
    let status: String
    let description: String?
    let onTapHandler: ()->Void
}

struct TasksListGroup {
    let title: String
    let items: [TasksListItem]
}

struct TasksListViewModel {
    let groups: [TasksListGroup]
}
