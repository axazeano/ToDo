//
//  StatusPickerRouter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class StatusPickerRouter {
    private let transitionHandler: TransitionHandler
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func close() {
        transitionHandler.dismiss(true, completion: nil)
    }
}
