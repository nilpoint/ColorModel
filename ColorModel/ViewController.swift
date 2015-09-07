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
  
  @IBOutlet var colorView: ColorView!
  @IBOutlet var hueLabel: UILabel!
  @IBOutlet var saturationLabel: UILabel!
  @IBOutlet var brightnessLabel: UILabel!
  @IBOutlet var webLabel: UILabel!
  
  @IBAction func changeHue(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.hue = slider.value
    }
  }
  
  @IBAction func changeSaturation(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.saturation = slider.value
    }
  }
  
  @IBAction func changeBrightness(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.brightness = slider.value      
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorModel.addObserver(self, forKeyPath: "hue", options: .allZeros, context: nil)
    colorModel.addObserver(self, forKeyPath: "saturation", options: .allZeros, context: nil)
    colorModel.addObserver(self, forKeyPath: "brightness", options: .allZeros, context: nil)
    colorModel.addObserver(self, forKeyPath: "color", options: .allZeros, context: nil)
    
    colorView.colorModel = colorModel
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
    switch keyPath {
      case "hue":
        hueLabel.text = "\(Int(colorModel.hue))°"
        break;
      case "saturation":
        saturationLabel.text = "\(Int(colorModel.saturation))%"
        break;
      case "brightness":
        brightnessLabel.text = "\(Int(colorModel.brightness))%"
        break;
      case "color":
        colorView.setNeedsDisplay()
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        colorModel.color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        webLabel.text = NSString(format: "#%02X%02X%02X", CInt(red*255), CInt(green*255), CInt(blue*255)) as String
        break;
    default:
      break;
    }
  }
}

