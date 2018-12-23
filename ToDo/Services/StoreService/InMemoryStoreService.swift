//
//  InMemoryStoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class InMemoryStoreService: StoreService {
    private var items = [ToDoItem]()
    
    func loadItems(
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        onSuccess(items)
    }
    
    func add(
        item: ToDoItem,
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        items.append(item)
        onSuccess()
    }
    
    func replace(
        oldItem: ToDoItem,
        with newItem: ToDoItem,
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        items = items.map {
            if $0 == oldItem {
                return newItem
            } else {
                return $0
            }
        }
    }
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping () -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        items = items.filter { $0 != item }
    }
    
    
}
