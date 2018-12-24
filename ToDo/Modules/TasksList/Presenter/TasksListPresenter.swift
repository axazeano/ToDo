//
//  TasksListPresenter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 23/12/2018.
//  Copyright © 2018 VoInc. All rights reserved.
//

import Foundation

final class TaskListPresenter {
    weak var view: TasksListView?
    var interactor: TasksListInteractorInput?
    var router: TasksListRouter?
    
    private let dateFormatter = DateFormatter()
    private let calendar = Calendar.current
    
    init() {
        dateFormatter.dateFormat = "d MMMM"
    }
}

extension TaskListPresenter: TasksListViewOutput {
    func loaded() {
        interactor?.requestTasks()
    }
    
    func appeared() {
        interactor?.requestTasks()
    }
    
    func requestCreateTask() {
        router?.showAddTask()
    }
    
    func requestConfigureFilter() {
        
    }
    
    
}

extension TaskListPresenter: TasksListInteractorOutput {
    func set(tasks: [ToDoItem]) {
        let viewModel = convertTasksToViewModel(tasks)
        view?.set(viewModel: viewModel)
    }
    
    func set(tasks: [ToDoItem], with status: ToDoStatus) {
        
    }
    
    func setErrorState() {
        
    }
    
    private func convertTasksToViewModel(_ tasks: [ToDoItem]) -> TasksListViewModel {
        let uniqueDates = Set(
            tasks.compactMap {
                self.extractDay(from: $0.dueDate)
            }
        )
        
        let sections = uniqueDates.sorted().map { (date) -> TasksListGroup in
            let groupedTasks = tasks.filter {
                self.calendar.compare(
                    date,
                    to: $0.dueDate,
                    toGranularity: .day
                ) == .orderedSame
            }
            return converTasksToViewSection(groupedTasks, date: date)
        }
        return TasksListViewModel(groups: sections)
    }
    
    private func converTasksToViewSection(_ tasks: [ToDoItem], date: Date) -> TasksListGroup {
        return TasksListGroup(
            title: dateFormatter.string(from: date),
            items: tasks.map { self.converTaskToViewItem($0) }
        )
    }
    
    private func converTaskToViewItem(_ task: ToDoItem) -> TasksListItem {
        return TasksListItem(
            title: task.title,
            status: task.status.name,
            note: task.note,
            dueDate: dateFormatter.string(from: task.dueDate),
            onTapHandler: { [weak self] in
                self?.router?.showEditTask(task)
            }
        )
    }
    
    private func extractDay(from date: Date) -> Date? {
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: dateComponents)
    }
}
