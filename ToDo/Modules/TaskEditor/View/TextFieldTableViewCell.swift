//
//  TextFieldTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TextFieldTableViewCell: UITableViewCell {
    private let textField = UITextField()
    
    var onTextChange: ((String?)->Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
        setupBehaviour()
    }
    
    func getText() -> String? {
        return textField.text
    }
    
    func apply(viewModel: ViewModel) {
        textField.placeholder = viewModel.placeholder
        textField.text = viewModel.value
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
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.height.equalTo(24)
        }
    }
    
    private func setupAppearance() {
        textField.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    private func setupBehaviour() {
        textField.returnKeyType = .done
        textField.delegate = self
    }
}

extension TextFieldTableViewCell {
    struct ViewModel {
        let placeholder: String
        let value: String?
    }
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onTextChange?(textField.text)
    }
}
