//
//  UserDefaultsStoreService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class UserDefaultsStoreService: StoreService {
    private let shareDataService: ShareDataService
    private var items = [ToDoItem]()
    private let userDefaults = UserDefaults.standard
    private let storeKey = "toDoData"
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    static let shared = UserDefaultsStoreService(
        shareDataService: ShareDataThrougUserDefaultService()
    )
    
    init(shareDataService: ShareDataService) {
        self.shareDataService = shareDataService
    }
    
    func loadItems(
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        guard let tasks = try? loadFromUserDefaults() else {
            onFailure(.loadItemsError)
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
        
        do {
            try storeToUserDefaults()
        } catch {
            onFailure(.storeItemsError)
            return
        }
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
        
        do {
            try storeToUserDefaults()
        } catch {
            onFailure(.storeItemsError)
            return
        }
        onSuccess(items)
    }
    
    func remove(
        item: ToDoItem,
        onSuccess: @escaping ([ToDoItem]) -> Void,
        onFailure: @escaping (StoreServiceError) -> Void
    ) {
        items = items.filter { $0 != item }
        
        do {
            try storeToUserDefaults()
        } catch {
            onFailure(.storeItemsError)
            return
        }
        onSuccess(items)
    }
    
    private func loadFromUserDefaults() throws -> [ToDoItem] {
        guard let data = userDefaults.data(forKey: storeKey) else {
            return [ToDoItem]()
        }
        
        let tasks = try decoder.decode([ToDoItem].self, from: data)
        return tasks
    }
    
    private func storeToUserDefaults() throws {
        shareDataService.share(items: items)
        let data = try encoder.encode(items)
        userDefaults.set(data, forKey: storeKey)
    }
}
