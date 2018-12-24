//
//  DeleteTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class DeleteTableViewCell: UITableViewCell {
    private let deleteLabel = UILabel()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        embedViews()
        setupLayout()
        setupAppearance()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        contentView.addSubview(deleteLabel)
    }
    
    private func setupLayout() {
        deleteLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.height.equalTo(24)
        }
    }
    
    private func setupAppearance() {
        deleteLabel.textAlignment = .center
        deleteLabel.textColor = .red
        deleteLabel.text = "Удалить"
    }
}
