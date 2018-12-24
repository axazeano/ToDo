//
//  InMemoryStoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class InMemoryStoreService: StoreService {
    private var items = [ToDoItem]()
    
    static let shared = InMemoryStoreService()
    
    func loadItems(
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        onSuccess(items)
    }
    
    func add(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        items.append(item)
        onSuccess(items)
    }
    
    func replace(
        oldItem: ToDoItem,
        with newItem: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        items = items.map {
            if $0 == oldItem {
                return newItem
            } else {
                return $0
            }
        }
        onSuccess(items)
    }
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        items = items.filter { $0 != item }
        onSuccess(items)
    }
    
    
}
