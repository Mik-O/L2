//
//  ViewController.swift
//  L2
//
//  Created by Таня Кожевникова on 04.06.2025.
//
import UIKit

class ColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    //MARK: - Public Properties
    var delegate: ColorViewControllerDelegate!
    var mainViewColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorView.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        addDoneButton(to: redTextField, greenTextField, blueTextField)
        
    }
    
    //MARK: - IB Actions
    @IBAction func doneButtonPressed() {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        //        redLabel.text = String(format: "%.2f", redSlider.value)
        //        greenLabel.text = String(format: "%.2f", greenSlider.value)
        //        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        switch sender.tag {
        case 0:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case 1:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        case 2:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        default: break
        }
        setColor()
    }
    
    //MARK: - Private Methods
        private func setColor() {
            colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                green: CGFloat(greenSlider.value),
                                                blue: CGFloat(blueSlider.value),
                                                alpha: 1.0)
        }
        
        private func setValue(for labels: UILabel...) {
            labels.forEach { label in
                switch label.tag {
                case 0: redLabel.text = string(from: redSlider)
                case 1: greenLabel.text = string(from: greenSlider)
                case 2: blueLabel.text = string(from: blueSlider)
                default: break
                }
            }
        }
        
        private func setValue(for textFields: UITextField...) {
            textFields.forEach { textField in
                switch textField.tag {
                case 0: redTextField.text = string(from: redSlider)
                case 1: greenTextField.text = string(from: greenSlider)
                case 2: blueTextField.text = string(from: blueSlider)
                default: break
                }
            }
        }
        
        private func setSliders() {
            let ciColor = CIColor(color: mainViewColor)
            
            redSlider.value = Float(ciColor.red)
            greenSlider.value = Float(ciColor.green)
            blueSlider.value = Float(ciColor.blue)
            
        }
        
        private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
        
        private func addDoneButton(to textFields: UITextField...) {
            
            textFields.forEach { textField in
                let keyboardToolbar = UIToolbar()
                textField.inputAccessoryView = keyboardToolbar
                keyboardToolbar.sizeToFit()
                
                let doneButton = UIBarButtonItem(
                    title: "Done",
                    style: .done,
                    target: self,
                    action: #selector(didTapDone)
                )
                
                let flexBarButton = UIBarButtonItem(
                    barButtonSystemItem: .flexibleSpace,
                    target: nil,
                    action: nil
                )
                
                keyboardToolbar.items = [flexBarButton, doneButton]
            }
        }
        
        @objc private func didTapDone() {
            view.endEditing(true)
        }
        
        private func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
}
    
    // MARK: - UITextFieldDelegate
    extension ColorViewController: UITextFieldDelegate {
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            guard let text = textField.text else { return }
            
            if let currentValue = Float(text) {
                switch textField.tag {
                case 0:
                    redSlider.setValue(currentValue, animated: true)
                    setValue(for: redLabel)
                case 1:
                    greenSlider.setValue(currentValue, animated: true)
                    setValue(for: greenLabel)
                case 2:
                    blueSlider.setValue(currentValue, animated: true)
                    setValue(for: blueLabel)
                default: break
                }
                
                setColor()
                return
            }
            
            showAlert(title: "Wrong format!", message: "Please enter current value")
        }
 }
    

