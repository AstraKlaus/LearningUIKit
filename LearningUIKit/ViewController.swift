//
//  ViewController.swift
//  LearningUIKit
//
//  Created by Андрей Касьянов on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redFlightButton: UIView!
    @IBOutlet var yellowFlightButton: UIView!
    @IBOutlet var greenFlightButton: UIView!
    
    @IBOutlet var generalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redFlightButton.alpha = 0.5
        redFlightButton.layer.cornerRadius = 55
        yellowFlightButton.alpha = 0.5
        yellowFlightButton.layer.cornerRadius = 55
        greenFlightButton.alpha = 0.5
        greenFlightButton.layer.cornerRadius = 55
        generalButton.layer.cornerRadius = 10
    }
    
    @IBAction private func generalPressed() {
        if redFlightButton.alpha == 0.5 && yellowFlightButton.alpha == 0.5 && greenFlightButton.alpha == 0.5{
            redFlightButton.alpha = 1
        }
        else if redFlightButton.alpha == 1{
            redFlightButton.alpha = 0.5
            yellowFlightButton.alpha = 1
        }
        else if yellowFlightButton.alpha == 1{
            yellowFlightButton.alpha = 0.5
            greenFlightButton.alpha = 1
        }
        else if greenFlightButton.alpha == 1{
            greenFlightButton.alpha = 0.5
            redFlightButton.alpha = 1
        }
    }
    
}

