//
//  ShareDataThrougUserDefaultService.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class ShareDataThrougUserDefaultService: ShareDataService {
    private let storeKey = "shareToDoItems"
    private let userDefaults = UserDefaults(suiteName: "group.sharingForToDo")
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    func share(items: [ToDoItem]) {
        guard let data = try? encoder.encode(items) else {
            return
        }
        userDefaults?.set(data, forKey: storeKey)
    }
    
    func load() -> [ToDoItem]? {
        guard let data = userDefaults?.data(forKey: storeKey) else {
            return [ToDoItem]()
        }
        
        return try? decoder.decode([ToDoItem].self, from: data)
    }
    
    
}
