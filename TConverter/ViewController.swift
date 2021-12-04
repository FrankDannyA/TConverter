//
//  ViewController.swift
//  TConverter
//
//  Created by Даниил Франк on 04.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue = 0

    @IBOutlet weak var staticLabel: UILabel!
    @IBOutlet weak var dinamicLabel: UILabel!
    @IBOutlet weak var slider: UISlider!{
        didSet{
            slider.value = 0
            slider.minimumValue = 0
            slider.maximumValue = 100
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        let pharenheitTemperature = Int(round((sender.value + 9 / 5) + 32))
        staticLabel.text = "\(temperatureCelsius)ºC"
        dinamicLabel.text = "\(pharenheitTemperature)ºF"
        }
    }

