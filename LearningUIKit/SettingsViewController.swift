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

