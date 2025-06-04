//
//  ViewController.swift
//  L2
//
//  Created by Таня Кожевникова on 04.06.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
//        redLabel.text = String(format: "%.2f", redSlider.value)
//        greenLabel.text = String(format: "%.2f", greenSlider.value)
//        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1.0)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = String(format: "%.2f", redSlider.value)
            case 1: greenLabel.text = String(format: "%.2f", greenSlider.value)
            case 2: blueLabel.text = String(format: "%.2f", blueSlider.value)
            default: break
            }
        }
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}
