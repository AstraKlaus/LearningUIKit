//
//  ViewController.swift
//  LearningUIKit
//
//  Created by Андрей Касьянов on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorBoardView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorBoardView.layer.cornerRadius = 10
        redLabel.text = String(format: "%.2f", redSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        colorBoardView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func rgbSlidersAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)

        greenLabel.text = String(format: "%.2f", greenSlider.value)

        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        colorBoardView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}

