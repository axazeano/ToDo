//
//  TransitionHandler.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation
import UIKit



/// Протокол, описывающий обёртку для View для осуществления роутинга на иные модули
public protocol TransitionHandler: class {
    func pushModule(
        with viewController: UIViewController,
        animated: Bool
    )
    func presentModule(
        with viewController: UIViewController,
        animated: Bool
    )
    func dismiss(
        _ animated: Bool,
        completion: (() -> Void)?
    )
}

public extension TransitionHandler where Self: UIViewController {
    func dismiss(_ animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            if let parent = self?.parent as? UINavigationController {
                parent.popViewController(animated: animated)
            } else {
                self?.dismiss(animated: animated, completion: completion)
            }
        }
    }
    
    func pushModule(with viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            if let parentNavigationController = self?.parent as? UINavigationController {
                parentNavigationController.pushViewController(viewController, animated: animated)
            }
        }
    }
    
    func presentModule(with viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            self?.present(viewController, animated: animated, completion: nil)
        }
    }
    
}

