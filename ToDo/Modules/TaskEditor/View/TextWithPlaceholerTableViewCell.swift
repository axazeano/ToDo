//
//  TextWithPlaceholerTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TextWithPlaceholerTableViewCell: UITableViewCell {
    private let placeholderLabel = UILabel()
    private let valueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(viewModel: ViewModel) {
        if let value = viewModel.value {
            valueLabel.text = value
            valueLabel.isHidden = false
            placeholderLabel.isHidden = true
        } else {
            placeholderLabel.text = viewModel.placeholder
            placeholderLabel.isHidden = false
            valueLabel.isHidden = true
        }
    }
    
    private func embedViews() {
        contentView.addSubview(placeholderLabel)
        contentView.addSubview(valueLabel)
    }
    
    private func setupLayout() {
        placeholderLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.height.equalTo(24)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.height.equalTo(24)
        }
    }
    
    private func setupAppearance() {
        placeholderLabel.textColor = .gray
        placeholderLabel.font = UIFont.systemFont(ofSize: 14.0)
        valueLabel.font = UIFont.systemFont(ofSize: 14.0)
    }
}

extension TextWithPlaceholerTableViewCell {
    struct ViewModel {
        let placeholder: String
        let value: String?
    }
}
