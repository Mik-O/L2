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
        blueSlider.minimumTrackTintColor = .blue
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
    }
    
}
