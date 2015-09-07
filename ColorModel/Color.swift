//
//  Color.swift
//  ColorModel
//
//  Created by John Alstru on 9/3/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class Color: NSObject {
  dynamic var hue: Float = 0.0
  dynamic var saturation: Float = 0.0
  dynamic var brightness: Float = 0.0
  
  var color: UIColor {
    return UIColor(hue: CGFloat(hue/360), saturation: CGFloat(saturation/100), brightness: CGFloat(brightness/100), alpha: 1.0)
  }
}