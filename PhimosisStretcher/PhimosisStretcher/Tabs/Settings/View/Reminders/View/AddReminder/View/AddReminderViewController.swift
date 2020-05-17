//
//  AddReminderViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class AddReminderViewController: UITableViewController, Storyboarded {
    
    var addReminderPresenter: AddReminderPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet weak var reminderDatePicker: UIDatePicker!
    @IBOutlet weak var reminderMessageTextBox: MDCTextField!
    @IBOutlet weak var reminderSoundSwitch: UISwitch!
    
    var reminderMessageTextBoxController: MDCTextInputControllerOutlined!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Reminder"
        
        reminderMessageTextBox.setupToolbar(view: self.view)

        reminderMessageTextBoxController = MDCTextInputControllerOutlined(textInput: reminderMessageTextBox)
        reminderMessageTextBoxController.activeColor = UIColor.appBlue
        reminderMessageTextBoxController.placeholderText = "Reminder Message"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addReminder))
    }
    
    @objc func addReminder()
    {
        addReminderPresenter.addReminder(
            time: reminderDatePicker.date,
            message: reminderMessageTextBox.text,
            useSound: reminderSoundSwitch.isOn)
    }

}

extension AddReminderViewController: AddReminderPresenterView {
    func errorOccurred(message: String) {
        self.alertHandlerService.showWarningAlert(view: self, message: message)
    }
}
