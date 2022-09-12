//
//  MainViewController.swift
//  LearningUIKit
//
//  Created by Андрей Касьянов on 08.09.2022.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainViewController: UIViewController {
    
    var redValue: CGFloat = 1
    var greenValue: CGFloat = 1
    var blueValue: CGFloat = 1
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.redValue = redValue
        settingsVC.greenValue = greenValue
        settingsVC.blueValue = blueValue
        settingsVC.delegate = self
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate{
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        redValue = red
        greenValue = green
        blueValue = blue
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

