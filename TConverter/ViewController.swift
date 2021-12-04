//
//  ViewController.swift
//  TConverter
//
//  Created by Даниил Франк on 04.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var setScale = ""
    var temperatureCelsius = 0

    @IBOutlet weak var staticLabel: UILabel!
    @IBOutlet weak var dinamicLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!{
        didSet{
            slider.value = 0
            slider.minimumValue = 0
            slider.maximumValue = 100
        }
    }
    
    @IBOutlet weak var changeT: UIButton! {
        didSet {
            changeT.layer.cornerRadius = 10
            changeT.layer.masksToBounds = true
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        temperatureCelsius = Int(round(sender.value))
        staticLabel.text = "\(temperatureCelsius)ºC"
        dinamicLabel.text = converterTemerature(celsiusValue: sender.value)
        
        }
    
    @IBAction func changeButtonAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Change the scale", message: "", preferredStyle: .actionSheet)
        
        let pharenheitAlert = UIAlertAction(title: "Pharenheit", style: .default) {(value) in
            self.setScale = "Pharenheit"
        }
        let kelvinAlert = UIAlertAction(title: "Kelvin", style: .default) {(_) in
            self.setScale = "Kelvin"
        }
        let rankinAlert = UIAlertAction(title: "Rankin", style: .default) {(_) in
            self.setScale = "Rankin"
        }
        let newtonAlert = UIAlertAction(title: "Newton", style: .default) {(_) in
            self.setScale = "Newton"
        }
        let reaumuruAlert = UIAlertAction(title: "Reaumuru", style: .default) {(_) in
            self.setScale = "Reaumuru"
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(pharenheitAlert)
        alert.addAction(kelvinAlert)
        alert.addAction(rankinAlert)
        alert.addAction(newtonAlert)
        alert.addAction(reaumuruAlert)
        alert.addAction(cancelAlert)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func converterTemerature(celsiusValue value: Float) -> String {
        
        switch setScale {
        case "Pharenheit":
            return "\((temperatureCelsius + 9 / 5) + 32)ºF"
        case "Kelvin":
            return "\(temperatureCelsius + Int(273.15))K"
        case "Rankin":
            return "\(Int(Double(temperatureCelsius) * 1.8000 + 491.67))ºR"
        case "Newton":
            return "\(Int(Double(temperatureCelsius) * 0.33))ºN"
        case "Reaumuru":
            return "\(Int(Double(temperatureCelsius) * 0.8))ºRe"
        default:
            return "Change the scale"
        }
        
        }
    }

