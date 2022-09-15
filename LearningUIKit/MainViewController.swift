//
//  MainViewController.swift
//  LearningUIKit
//
//  Created by Андрей Касьянов on 08.09.2022.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func setNewColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.backColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate{
    func setNewColor(_ color: UIColor) {
        let rgbColored = CIColor(color: color)
        view.backgroundColor = UIColor(red: rgbColored.red, green: rgbColored.green, blue: rgbColored.blue, alpha: 1)
    }
}

