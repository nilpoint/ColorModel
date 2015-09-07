//
//  ViewController.swift
//  ColorModel
//
//  Created by John Alstru on 9/3/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var colorModel = Color()
  @IBOutlet var colorView: UIView!
  @IBOutlet var hueLabel: UILabel!
  @IBOutlet var saturationLabel: UILabel!
  @IBOutlet var brightnessLabel: UILabel!
  
  @IBAction func changeHue(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.hue = slider.value
      colorView.backgroundColor = colorModel.color
      hueLabel.text = NSString(format: "%.0f°", colorModel.hue) as String
    }
  }
  
  @IBAction func changeSaturation(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.saturation = slider.value
      colorView.backgroundColor = colorModel.color
      saturationLabel.text = NSString(format: "%.0f%%", colorModel.saturation) as String
    }
  }
  
  @IBAction func changeBrightness(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.brightness = slider.value
      colorView.backgroundColor = colorModel.color
      brightnessLabel.text = NSString(format: "%.0f%%", colorModel.brightness) as String
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

