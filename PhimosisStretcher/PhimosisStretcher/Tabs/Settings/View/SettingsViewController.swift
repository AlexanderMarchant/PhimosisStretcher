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
    @IBOutlet weak var targetWorkoutsPerDayTextBox: MDCTextField!
    
    @IBOutlet weak var vibrateCueSwitch: UISwitch!
    @IBOutlet weak var visualCueSwitch: UISwitch!
    @IBOutlet weak var audioCueSwitch: UISwitch!
    
    var repsPerWorkoutTextBoxController: MDCTextInputControllerOutlined!
    var repLengthTextBoxController: MDCTextInputControllerOutlined!
    var restLengthTextBoxController: MDCTextInputControllerOutlined!
    var prepareLengthTextBoxController: MDCTextInputControllerOutlined!
    var targetWorkoutsPerDayTextBoxController: MDCTextInputControllerOutlined!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        navigationItem.setLeftBarButton(nil, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveChanges))
        
        vibrateCueSwitch.addTarget(self, action: #selector(vibrateCuesSwitchTouched), for: UIControl.Event.valueChanged)
        visualCueSwitch.addTarget(self, action: #selector(visualCuesSwitchTouched), for: UIControl.Event.valueChanged)
        audioCueSwitch.addTarget(self, action: #selector(audioCuesSwitchTouched), for: UIControl.Event.valueChanged)
        
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

        repsPerWorkoutTextBoxController = MDCTextInputControllerOutlined(textInput: repsPerWorkoutTextBox)
        repsPerWorkoutTextBoxController.activeColor = UIColor.appBlue
        repsPerWorkoutTextBoxController.placeholderText = "Reps Per Workout"

        repLengthTextBoxController = MDCTextInputControllerOutlined(textInput: repLengthTextBox)
        repLengthTextBoxController.activeColor = UIColor.appBlue
        repLengthTextBoxController.placeholderText = "Rep Length"

        restLengthTextBoxController = MDCTextInputControllerOutlined(textInput: restLengthTextBox)
        restLengthTextBoxController.activeColor = UIColor.appBlue
        restLengthTextBoxController.placeholderText = "Rest Length"

        prepareLengthTextBoxController = MDCTextInputControllerOutlined(textInput: prepareLengthTextBox)
        prepareLengthTextBoxController.activeColor = UIColor.appBlue
        prepareLengthTextBoxController.placeholderText = "Prepare Length"

        targetWorkoutsPerDayTextBoxController = MDCTextInputControllerOutlined(textInput: targetWorkoutsPerDayTextBox)
        targetWorkoutsPerDayTextBoxController.activeColor = UIColor.appBlue
        targetWorkoutsPerDayTextBoxController.placeholderText = "Target Workouts Per Day"
        
        tableView.register(UINib.init(nibName: Constants.kegelTrainerCell, bundle: nil), forCellReuseIdentifier: Constants.kegelTrainerCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingsPresenter.getWorkoutSettings()
        settingsPresenter.getCueSettings()
    }
    
    @objc func saveChanges()
    {
        settingsPresenter.saveChanges(
            targetWorkoutsPerDay: targetWorkoutsPerDayTextBox.text,
            repsPerWorkout: repsPerWorkoutTextBox.text,
            repLength: repLengthTextBox.text,
            restLength: restLengthTextBox.text,
            prepareLength: prepareLengthTextBox.text
        )
    }
    
    @objc func vibrateCuesSwitchTouched() {
        settingsPresenter.updateVibrateCue()
    }
    
    @objc func visualCuesSwitchTouched() {
        settingsPresenter.updateVisualCue()
    }
    
    @objc func audioCuesSwitchTouched() {
        settingsPresenter.updateAudioCue()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath {
        case Constants.emailCellIndexPath:
            settingsPresenter.sendEmail()
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath == Constants.kegelTrainerCellIndexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kegelTrainerCell, for: indexPath) as! KegelTrainerCell
            
            cell.kegelTrainerLogo.layer.cornerRadius = 5
            
            return cell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath == Constants.kegelTrainerCellIndexPath) {
            return 140
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }

}

extension SettingsViewController: SettingsPresenterView {
    func didGetWorkoutSettings(_ targetWorkoutsPerDay: String, _ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String) {
        targetWorkoutsPerDayTextBox.text = targetWorkoutsPerDay
        repsPerWorkoutTextBox.text = repsPerWorkout
        repLengthTextBox.text = repLength
        restLengthTextBox.text = restLength
        prepareLengthTextBox.text = prepareLength
    }
    
    func didGetCueSettings(_ useVibrateCues: Bool, _ useVisualCues: Bool, _ useAudioCues: Bool) {
        vibrateCueSwitch.isOn = useVibrateCues
        visualCueSwitch.isOn = useVisualCues
        audioCueSwitch.isOn = useAudioCues
    }
    
    func savedChanges() {
        self.alertHandlerService.showCustomAlert(
            view: self,
            title: "Settings Saved",
            message: "Your settings have been saved",
            actionTitles: ["Ok"],
            actions: [
                { (alert: UIAlertAction!) in print("Changes have been saved") }
            ]
        )
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
