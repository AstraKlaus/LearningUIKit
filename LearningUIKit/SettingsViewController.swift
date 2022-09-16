//
//  SettingsViewController.swift
//  LearningUIKit
//
//  Created by Андрей Касьянов on 04.07.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var colorBoardView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var backColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorBoardView.layer.cornerRadius = 10
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        colorBoardView.backgroundColor = backColor
    }
    
    func setSliders(){
        let rgbColor = CIColor(color: backColor)
        
        redSlider.value = Float(rgbColor.red)
        greenSlider.value = Float(rgbColor.green)
        blueSlider.value = Float(rgbColor.blue)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    @IBAction func rgbSlidersAction() {
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        colorBoardView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(colorBoardView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showAlert(title: "Wrong format!", message: "Please enter correct value")
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redLabel)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueLabel)
            }
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        showAlert(title: "Wrong format!", message: "Please enter correct value")
        textField.resignFirstResponder()
        let keyboardToolbar = UIToolbar()
        textField.keyboardType = .decimalPad
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
        textField.inputAccessoryView = keyboardToolbar
    }
}


// MARK: - SetValue
extension SettingsViewController{
    func setValue(for labels: UILabel...){
        labels.forEach{lable in
            switch lable{
            case redLabel:
                redLabel.text = String(format: "%.2f", redSlider.value)
            case greenLabel:
                greenLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                blueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    func setValue(for textFields: UITextField...){
        textFields.forEach{textField in
            switch textField{
            case redTextField:
                redTextField.text = String(format: "%.2f", redSlider.value)
            case greenTextField:
                greenTextField.text = String(format: "%.2f", greenSlider.value)
            default:
                blueTextField.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
}
// MARK: - ShowAlert
extension SettingsViewController{
     func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
