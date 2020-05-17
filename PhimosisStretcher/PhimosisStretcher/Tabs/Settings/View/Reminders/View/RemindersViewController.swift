//
//  RemindersTableViewController.swift
//  Phimosis Stretcher
//
//  Created by Alex Marchant on 03/02/2019.
//  Copyright © 2019 Alex Marchant. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class RemindersViewController: UITableViewController, Storyboarded {
    
    var remindersPresenter: RemindersPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    var reminders = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Reminders"
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addReminder))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reminderCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        remindersPresenter.getReminders()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reminderCell, for: indexPath)
        
        let reminder = reminders[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        cell.textLabel?.text = formatter.string(from: reminder.time)
        cell.detailTextLabel?.text = reminder.message
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            remindersPresenter.deleteReminder(reminders: reminders, deleteAt: indexPath.row)
        }
    }
    
    @objc func addReminder()
    {
        self.remindersPresenter.addReminder()
    }
}

extension RemindersViewController: RemindersPresenterView {
    func didGetReminders(reminders: [Reminder]) {
        self.reminders = reminders
        tableView.reloadData()
    }
    
    func errorOccurred(message: String) {
        self.alertHandlerService.showWarningAlert(view: self, message: message)
    }
}

extension RemindersViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "No Reminders Setup"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.foregroundColor: UIColor.psLightGray]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "You have not setup any reminders yet."
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1), NSAttributedString.Key.foregroundColor: UIColor.psLightGray]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
}
