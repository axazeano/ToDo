//
//  TaskEditorViewController.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TaskEditorViewController: UIViewController, TaskEditorView {
    var output: TaskEditorViewOutput?
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupBehavior()
    }
    
    
    private func embedViews() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func setupAppearance() {
        tableView.backgroundColor = .white
    }
    
    private func setupBehavior() {
        
    }
}

extension TaskEditorViewController: TaskEditorViewInput{
    func set(viewModel: TaskEditorViewModel) {
        
    }
    
    func showDatePicker() {
        
    }
    
    func showDeleteAlert() {
        
    }
    
    
}
