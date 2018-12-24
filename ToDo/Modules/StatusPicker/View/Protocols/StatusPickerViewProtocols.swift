//
//  StatusPickerViewProtocols.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

protocol StatusPickerViewInput: class {
    func apply(viewModel: [StatusPickerViewItem])
}

protocol StatusPickerViewOutput: class {
    func loaded()
    func requestToClose()
}

protocol StatusPickerView: StatusPickerViewInput, TransitionHandler {
    var output: StatusPickerViewOutput? { get set }
}
