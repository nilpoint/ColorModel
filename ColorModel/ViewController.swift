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
  @IBOutlet var webLabel: UILabel!
  
  @IBAction func changeHue(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.hue = slider.value
      updateColor()
    }
  }
  
  @IBAction func changeSaturation(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.saturation = slider.value
      updateColor()
    }
  }
  
  @IBAction func changeBrightness(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.brightness = slider.value
      updateColor()
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

  func updateColor() {
    let color = colorModel.color
    
    colorView.backgroundColor = color
    
    hueLabel.text = "\(Int(colorModel.hue))°"
    saturationLabel.text = "\(Int(colorModel.saturation))%"
    brightnessLabel.text = "\(Int(colorModel.brightness))%"
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    webLabel.text = NSString(format: "#%02X%02X%02X", CInt(red*255), CInt(green*255), CInt(blue*255)) as String
  }

}

