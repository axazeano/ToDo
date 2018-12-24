//
//  StatusPickerPresenter.swift
//  ToDo
//
//  Created by Владимир Кубанцев on 24/12/2018.
//  Copyright © 2018 Kinoplan. All rights reserved.
//

import Foundation

final class StatusPickerPresenter {
    weak var view: StatusPickerView?
    var selectedStatus: ToDoStatus?
    var moduleOutput: StatusPickerModuleOutput?
    var router: StatusPickerRouter?
}

extension StatusPickerPresenter: StatusPickerViewOutput {
    func loaded() {
        let viewModel = buildViewModel()
        view?.apply(viewModel: viewModel)
    }
    
    func requestToClose() {
        router?.close()
    }
    
    private func buildViewModel() -> [StatusPickerViewItem] {
        return ToDoStatus.allCases.map { [weak self] (status) in
            StatusPickerViewItem(
                title: status.name,
                onPressHandler: {
                    self?.moduleOutput?.set(status: status)
                    self?.router?.close()
                },
                isSelected: self?.isStatusSelected(status) ?? false
            )
        }
    }
    
    private func isStatusSelected(_ status: ToDoStatus) -> Bool {
        guard let selectedStatus = selectedStatus else {
            return false
        }
        return status == selectedStatus
    }
}
