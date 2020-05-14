//
//  SettingsViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class SettingsViewController: UITableViewController, Storyboarded {
    
    var settingsPresenter: SettingsPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet weak var repsPerWorkoutTextBox: MDCTextField!
    @IBOutlet weak var repLengthTextBox: MDCTextField!
    @IBOutlet weak var restLengthTextBox: MDCTextField!
    @IBOutlet weak var prepareLengthTextBox: MDCTextField!
    
    @IBOutlet weak var vibrateCueSwitch: UISwitch!
    @IBOutlet weak var visualCueSwitch: UISwitch!
    @IBOutlet weak var soundCueSwitch: UISwitch!
    
    var repsPerSetTextBoxController: MDCTextInputControllerOutlined!
    var repLengthTextBoxController: MDCTextInputControllerOutlined!
    var restLengthTextBoxController: MDCTextInputControllerOutlined!
    var prepareLengthTextBoxController: MDCTextInputControllerOutlined!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveChanges))
        
        repsPerWorkoutTextBox.keyboardType = .numberPad
        repLengthTextBox.keyboardType = .numberPad
        restLengthTextBox.keyboardType = .numberPad
        prepareLengthTextBox.keyboardType = .numberPad
        
        repsPerWorkoutTextBox.setupToolbar(view: self.view)
        repLengthTextBox.setupToolbar(view: self.view)
        restLengthTextBox.setupToolbar(view: self.view)
        prepareLengthTextBox.setupToolbar(view: self.view)
        
        repsPerWorkoutTextBox.delegate = self
        repLengthTextBox.delegate = self
        restLengthTextBox.delegate = self
        prepareLengthTextBox.delegate = self

        repsPerSetTextBoxController = MDCTextInputControllerOutlined(textInput: repsPerWorkoutTextBox)
        repsPerSetTextBoxController.activeColor = UIColor.black
        repsPerSetTextBoxController.placeholderText = "Reps Per Workout"

        repLengthTextBoxController = MDCTextInputControllerOutlined(textInput: repLengthTextBox)
        repLengthTextBoxController.activeColor = UIColor.black
        repLengthTextBoxController.placeholderText = "Rep Length"

        restLengthTextBoxController = MDCTextInputControllerOutlined(textInput: restLengthTextBox)
        restLengthTextBoxController.activeColor = UIColor.black
        restLengthTextBoxController.placeholderText = "Rest Length"

        prepareLengthTextBoxController = MDCTextInputControllerOutlined(textInput: prepareLengthTextBox)
        prepareLengthTextBoxController.activeColor = UIColor.black
        prepareLengthTextBoxController.placeholderText = "Prepare Length"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingsPresenter.getWorkoutSettings()
    }
    
    @objc func saveChanges()
    {
        settingsPresenter.saveChanges(
            repsPerWorkout: repsPerWorkoutTextBox.text,
            repLength: repLengthTextBox.text,
            restLength: restLengthTextBox.text,
            prepareLength: prepareLengthTextBox.text
        )
    }

}

extension SettingsViewController: SettingsPresenterView {
    func didGetWorkoutSettings(_ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String) {
        repsPerWorkoutTextBox.text = repsPerWorkout
        repLengthTextBox.text = repLength
        restLengthTextBox.text = restLength
        prepareLengthTextBox.text = prepareLength
    }
    
    func savedChanges() {
    }
    
    func errorOccurred(message: String) {
        self.alertHandlerService.showWarningAlert(view: self, message: message)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
