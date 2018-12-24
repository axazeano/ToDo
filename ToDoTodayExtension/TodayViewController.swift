//
//  TodayViewController.swift
//  ToDoTodayExtension
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import UIKit
import Foundation
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var tableView: UITableView!
    
    private let shareDataService = ShareDataThrougUserDefaultService()
    private let cellReuseIdentifier = "taskCell"
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    private var viewItems: [ViewItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "d.M"
        tableView.dataSource = self
        loadToDoItems()
    }
        
    func widgetPerformUpdate(
        completionHandler: (@escaping (NCUpdateResult) -> Void)
    ) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    private func loadToDoItems() {
        guard let toDoItems = shareDataService.load() else {
            return
        }
        viewItems = buildListOfDisplayedItems(from: toDoItems)
        tableView.reloadData()
    }
    
    private func buildListOfDisplayedItems(
        from toDoItems: [ToDoItem]
    ) -> [ViewItem] {
        let currentDate = Date()
        let actualTasks = toDoItems
        .filter {
            self.calendar.compare(
                $0.dueDate,
                to: currentDate,
                toGranularity: .day
            ) == .orderedDescending
        }
        .filter { $0.status != .completed }
        .sorted(by: { $0.dueDate < $1.dueDate })
        
        let tasksToDisplay = actualTasks.count < 6 ? actualTasks : Array(actualTasks[0...5])
        return tasksToDisplay.map {
            self.convertToDoItemToViewItem($0)
        }
        
    }
    
    private func convertToDoItemToViewItem(
        _ toDoItem: ToDoItem
    ) -> ViewItem {
        
        return ViewItem(
            title: toDoItem.title,
            status: toDoItem.status.name,
            dueDate: dateFormatter.string(from: toDoItem.dueDate)
        )
    }
}

extension TodayViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return viewItems?.count ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let viewItem = viewItems?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.text = viewItem.title
        cell.detailTextLabel?.text = viewItem.status
        return cell
    }
}


extension TodayViewController {
    private struct ViewItem {
        let title: String
        let status: String
        let dueDate: String
    }
}
