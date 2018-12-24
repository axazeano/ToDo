//
//  StoreServiceErrors.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

enum StoreServiceError: Error {
    case requestError
    case loadItemsError
    case storeItemsError
    case duplicateTaskError
}
