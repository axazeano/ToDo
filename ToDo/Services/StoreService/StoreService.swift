//
//  StoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol StoreService: class {
    func loadItems(
        onSuccess: @escaping ([ToDoItem])->Void,
        onFailure: @escaping (StoreServiceError)->Void
    )
    
    func add(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem])->Void,
        onFailure: @escaping (StoreServiceError)->Void
    )
    
    func replace(
        oldItem: ToDoItem,
        with newItem: ToDoItem,
        onSuccess: @escaping ([ToDoItem])->Void,
        onFailure: @escaping (StoreServiceError)->Void
    )
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem])->Void,
        onFailure: @escaping (StoreServiceError)->Void
    )
}
