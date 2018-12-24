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

final class TaskEditorViewController: UITableViewController, TaskEditorView {
    var output: TaskEditorViewOutput?
    private var viewModel: TaskEditorViewModel?
    private let textFieldCellReuseIdentifier = "textFieldCellReuseIdentifier"
    private let textCellReuseIdentifier = "textCellReuseIdentifier"
    private let textAreaCellReuseIdentifier = "textAreaCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        embedViews()
//        setupLayout()
        setupAppearance()
        setupBehavior()
        setupNavigationItem()
        output?.loaded()
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        
        tableView.register(
            TextFieldTableViewCell.self,
            forCellReuseIdentifier: textFieldCellReuseIdentifier
        )
        tableView.register(
            TextTableViewCell.self,
            forCellReuseIdentifier: textCellReuseIdentifier
        )
        tableView.register(
            TextAreaTableViewCell.self,
            forCellReuseIdentifier: textAreaCellReuseIdentifier
        )
    }
    
    private func setupNavigationItem() {
        let closeNavigationButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: nil,
            action: nil
        )
        navigationItem.leftBarButtonItem = closeNavigationButton
        
        let saveNavatigationButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: nil
        )
        
        navigationItem.rightBarButtonItem = saveNavatigationButton
    }
    
    @objc
    private func handleSaveButtonPressed() {
        
    }
}

extension TaskEditorViewController: TaskEditorViewInput{
    func set(viewModel: TaskEditorViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    // FIXME: Костыль с просторов интернета
    func showDatePicker() {
        
    }
    
    func showDeleteAlert() {
        
    }
    
    func showStatusPicker() {
    }
}

extension TaskEditorViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableStructure.Sections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = TableStructure.Sections(rawValue: section) else {
            return nil
        }
        return section.title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = TableStructure.Sections(rawValue: indexPath.section),
            let viewModel = viewModel
        else {
            return UITableViewCell()
        }
        
        switch section {
        case .title:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: textFieldCellReuseIdentifier
            ) as! TextFieldTableViewCell
            cell.apply(viewModel: .init(
                    placeholder: "Название задачи",
                    value: viewModel.title
                )
            )
            cell.onTextChange = viewModel.onTitleChange
            return cell
            
        case .dueDate:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: textCellReuseIdentifier
            ) as! TextTableViewCell
            cell.set(text: viewModel.dueDate)
            return cell
            
        case .status:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: textCellReuseIdentifier
            ) as! TextTableViewCell
            cell.set(text: viewModel.status)
            return cell
            
        case .notes:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: textAreaCellReuseIdentifier
            ) as! TextAreaTableViewCell
            if let note = viewModel.note {
                cell.set(text: note)
            }
            cell.onTextChange = viewModel.onNoteChange
            return cell
        }
    }
}

private extension TaskEditorViewController {
    
    struct TableStructure {
        enum Sections: Int, CaseIterable {
            case title
            case dueDate
            case status
            case notes
            
            var title: String {
                switch self {
                case .title: return "Название"
                case .dueDate: return "Выполнить до"
                case .status: return "Статус задачи"
                case .notes: return "Заметки"
                }
            }
        }
    }
}

extension TaskEditorViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = TableStructure.Sections(rawValue: indexPath.section) else {
            return
        }
        switch section {
        case .dueDate:
            viewModel?.onDueDatePress()
        default: return
        }
    }
}
