//
//  StatusPickerTableViewController.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation
import UIKit

class StatusPickerTableViewController: UITableViewController, StatusPickerView {
    var output: StatusPickerViewOutput?
    
    private let cellIdentifier = "statusCell"
    private var viewModel: [StatusPickerViewItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.loaded()
    }
}

extension StatusPickerTableViewController: StatusPickerViewInput {
    func apply(viewModel: [StatusPickerViewItem]) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension StatusPickerTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        if cellViewModel.isSelected {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        cell.textLabel?.text = cellViewModel.title
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel?.count ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard let cellViewModel = viewModel?[indexPath.row] else {
            return
        }
        cellViewModel.onPressHandler()
    }
}
