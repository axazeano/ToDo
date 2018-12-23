//
//  TasksListViewController.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class TasksListViewController: UIViewController, TasksListView {
    var output: TasksListViewOutput?
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let reuseIdentifier = "TaskCell"
    private var viewModel: TasksListViewModel?
    
    private func embedViews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupBehaviour()
        setupNavigationItem()
        output?.loaded()
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
    
    private func setupBehaviour() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            TaskListTableViewCell.self,
            forCellReuseIdentifier: reuseIdentifier
        )
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "ToDo"
        
        let filterNavigationButton = UIBarButtonItem(
            barButtonSystemItem: .organize,
            target: self,
            action: #selector(handleFilterNavigationButtonPressed)
        )
        navigationItem.leftBarButtonItem = filterNavigationButton
        
        let createTaskNavigationButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(handleCreateTaskButtonPressed)
        )
        navigationItem.rightBarButtonItem = createTaskNavigationButton
    }
    
    @objc
    private func handleFilterNavigationButtonPressed() {
        output?.requestConfigureFilter()
    }
    
    @objc
    private func handleCreateTaskButtonPressed() {
        output?.requestCreateTask()
    }
}

extension TasksListViewController: TasksListViewInput {
    func set(viewModel: TasksListViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func showOnDeleteAlert(
        okAction: @escaping () -> Void,
        cancelAction: @escaping () -> Void
    ) {
        
    }
}

extension TasksListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel?.groups[section].items.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.groups.count ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: reuseIdentifier
            ) as? TaskListTableViewCell
        else {
            return UITableViewCell()
        }
        
        let viewModelForCell = viewModel.groups[indexPath.section].items[indexPath.row]
        
        cell.apply(viewModel: viewModelForCell)
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
        return viewModel?.groups[section].title
    }
}

extension TasksListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.groups[indexPath.section].items[indexPath.row].onTapHandler()
    }
}


