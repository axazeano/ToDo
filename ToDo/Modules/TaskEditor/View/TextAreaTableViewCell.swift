//
//  TextAreaTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TextAreaTableViewCell: UITableViewCell {
    private let textArea = UITextView()
    
    var onTextChange: ((String?)->Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupBehaviour()
    }
    
    func getText() -> String? {
        return textArea.text
    }
    
    func set(text: String) {
        textArea.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        contentView.addSubview(textArea)
    }
    
    private func setupLayout() {
        textArea.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(100)
        }
    }
    
    private func setupBehaviour() {
        textArea.delegate = self
    }
}

extension TextAreaTableViewCell: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            onTextChange?(nil)
        } else {
            onTextChange?(textView.text)
        }
        
    }
}
