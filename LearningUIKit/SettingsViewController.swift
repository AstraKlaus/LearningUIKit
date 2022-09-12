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
    
    var redValue: CGFloat!
    var greenValue: CGFloat!
    var blueValue: CGFloat!
    
    var delegate: SettingsViewControllerDelegate!
    var backColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorBoardView.layer.cornerRadius = 10
        
        redLabel.text = String(format: "%.2f", Float(redValue))
        greenLabel.text = String(format: "%.2f", Float(greenValue))
        blueLabel.text = String(format: "%.2f", Float(blueValue))
        
        redSlider.value = Float(redValue)
        greenSlider.value = Float(greenValue)
        blueSlider.value = Float(blueValue)
        
        colorBoardView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        redTextField.inputAccessoryView = toolBar()
        redTextField.keyboardType = .decimalPad
        
        greenTextField.inputAccessoryView = toolBar()
        greenTextField.keyboardType = .decimalPad
        
        blueTextField.inputAccessoryView = toolBar()
        blueTextField.keyboardType = .decimalPad
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func rgbSlidersAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)

        greenLabel.text = String(format: "%.2f", greenSlider.value)

        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        colorBoardView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else {return}
        guard let colorValue = Float(newValue) else {return}
        if textField == redTextField{
            redSlider.value = colorValue
            redLabel.text = String(colorValue)
        }else if textField == greenTextField{
            greenSlider.value = colorValue
            greenLabel.text = String(colorValue)
        }else{
            blueSlider.value = colorValue
            blueLabel.text = String(colorValue)
        }
        
    }
}

// MARK: - NumberPad Keyboard
extension SettingsViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(onClickDoneButton))
        doneButton.tintColor = .systemBlue
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }
}
