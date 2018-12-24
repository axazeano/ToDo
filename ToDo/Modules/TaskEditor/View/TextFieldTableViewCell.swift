//
//  TextFieldTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TextFieldTableViewCell: UITableViewCell {
    private let textField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    func getText() -> String? {
        return textField.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        contentView.addSubview(textField)
    }
    
    private func setupLayout() {
        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    private func setupAppearance() {
        
    }
}

extension TextFieldTableViewCell {
    struct ViewModel {
        let placeholder: String
        let value: String?
    }
}
