//
//  TaskEditorRouter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class TaskEditorRouter {
    private let transitionHandler: TransitionHandler
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func showDatePicker(
        lowBoundaryDate: Date,
        onAccept: @escaping (Date)->Void
    ) {
        let datePicker = DatePicker()
        datePicker.okButtonHandler = onAccept
        datePicker.minimumDate = lowBoundaryDate
        transitionHandler.presentModule(with: datePicker, animated: true)
    }
}
