//
//  StoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 22/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

protocol StoreService: class {
    func loadItems(
        onSuccess: @escaping ([ToDoItem])->Void,
        onFailure: @escaping (Error?)->Void
    )
    
    func add(
        item: ToDoItem,
        onSuccess: @escaping ()->Void,
        onFailure: @escaping (Error?)->Void
    )
    
    func replace(
        oldItem: ToDoItem,
        with newItem: ToDoItem,
        onSuccess: @escaping ()->Void,
        onFailure: @escaping (Error?)->Void
    )
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping ()->Void,
        onFailure: @escaping (Error?)->Void
    )
}
