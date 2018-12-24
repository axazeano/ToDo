//
//  DatePicker.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation
import UIKit

// TODO: Хорошо бы это дело в Viper модуль засунуть, но как со времем получится
final class DatePicker: UIAlertController {
    
    var okButtonHandler: ((Date)->Void)?
    var cancelButtonHandler: (()->Void)?
    
    override var preferredStyle: UIAlertController.Style {
        return .actionSheet
    }
    
    private let datePicker = UIDatePicker()
    
    var minimumDate: Date? {
        didSet {
            datePicker.minimumDate = minimumDate
        }
    }
    
    override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        embedViews()
        setupActions()
        setupAppearance()
        setupBehaviour()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        view.addSubview(datePicker)
    }
    
    private func setupBehaviour() {
        datePicker.datePickerMode = .date
    }
    
    private func setupAppearance() {
        // FIXME: убрать костыль
        title = "\n\n\n\n\n\n\n\n\n\n\n"
    }
    
    
    private func setupActions() {
        let ok = UIAlertAction(title: "ОК", style: .default) { (action) in
            self.okButtonHandler?(self.datePicker.date)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        addAction(ok)
        addAction(cancel)
    }
}
