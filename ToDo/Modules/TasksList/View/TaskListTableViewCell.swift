//
//  TaskListTableViewCell.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TaskListTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let noteLabel = UILabel()
    private let statusLabel = UILabel()
    private let dueDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(viewModel: TasksListItem) {
        titleLabel.text = viewModel.title
        noteLabel.text = viewModel.note
        statusLabel.text = viewModel.status
        dueDateLabel.text = viewModel.dueDate
    }
    
    private func embedViews() {
        [
            titleLabel,
            noteLabel,
            statusLabel,
            dueDateLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.trailing.lessThanOrEqualTo(dueDateLabel.snp.leading).offset(8)
        }
        
        dueDateLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.top.equalTo(contentView.snp.top).offset(8)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        noteLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(statusLabel.snp.bottom).offset(4)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
    }
    
    private func setupAppearance() {
        selectionStyle = .gray
        titleLabel.lineBreakMode = .byTruncatingTail
        noteLabel.numberOfLines = 0
    }
}
