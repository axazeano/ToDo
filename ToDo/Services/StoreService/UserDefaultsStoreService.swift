//
//  UserDefaultsStoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class UserDefaultsStoreService: StoreService {
    private var items = [ToDoItem]()
    private let userDefaults = UserDefaults.standard
    private let storeKey = "toDoData"
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    static let shared = UserDefaultsStoreService()
    
    func loadItems(
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        guard let tasks = loadFromUserDefaults() else {
            onFailure(.requestError)
            return
        }
        items = tasks
        onSuccess(items)
    }
    
    func add(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        guard !items.contains(where: { $0.title == item.title }) else {
            onFailure(.duplicateTaskError)
            return
        }
        items.append(item)
        storeToUserDefaults()
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
        storeToUserDefaults()
        onSuccess(items)
    }
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        items = items.filter { $0 != item }
        storeToUserDefaults()
        onSuccess(items)
    }
    
    private func loadFromUserDefaults() -> [ToDoItem]? {
        guard let data = userDefaults.data(forKey: storeKey) else {
            return [ToDoItem]()
        }
        
        guard let tasks = try? decoder.decode([ToDoItem].self, from: data) else {
            return nil
        }
        
        return tasks
    }
    
    private func storeToUserDefaults() {
        guard let data = try? encoder.encode(items) else {
            return
        }
        userDefaults.set(data, forKey: storeKey)
    }
}
