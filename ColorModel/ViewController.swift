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
  
  @IBAction func changeHue(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.hue = slider.value
      colorView.backgroundColor = colorModel.color
    }
  }
  
  @IBAction func changeSaturation(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.saturation = slider.value
      colorView.backgroundColor = colorModel.color
    }
  }
  
  @IBAction func changeBrightness(sender: AnyObject) {
    if let slider = sender as? UISlider {
      colorModel.brightness = slider.value
      colorView.backgroundColor = colorModel.color
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

