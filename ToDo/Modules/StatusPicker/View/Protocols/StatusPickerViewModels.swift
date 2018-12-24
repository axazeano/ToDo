//
//  StatusPickerViewModels.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

struct StatusPickerViewItem {
    let title: String
    let onPressHandler: ()->Void
    let isSelected: Bool
}
