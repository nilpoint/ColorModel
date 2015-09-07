//
//  ColorView.swift
//  ColorModel
//
//  Created by John Alstru on 9/7/15.
//  Copyright (c) 2015 nilpoint.sample. All rights reserved.
//

import UIKit

class ColorView : UIView
{
  let radius: CGFloat = 20.0
  
  var colorModel: Color?
  var brightness: Float = 0
  var hsImage: UIImage?
  
  override func drawRect(rect: CGRect) {
    if let color = colorModel {
      let bounds = self.bounds
      if hsImage != nil &&
        ( brightness != color.brightness || bounds.size != hsImage!.size) {
          hsImage = nil
      }
      
      if hsImage == nil {
        brightness = color.brightness
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 1.0)
        let imageContext = UIGraphicsGetCurrentContext()
        for y in 0..<Int(bounds.height) {
          for x in 0..<Int(bounds.width) {
            let uiColor = UIColor(hue: CGFloat(x)/bounds.width, saturation: CGFloat(y)/bounds.height, brightness: CGFloat(brightness/100.0), alpha: 1.0)
            uiColor.set()
            CGContextFillRect(imageContext, CGRect(x: x, y: y, width: 1, height: 1))
          }
        }
        hsImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
      }
      
      hsImage!.drawInRect(bounds)
      
      let circleRect = CGRect(x: bounds.maxX*CGFloat(color.hue/360)-radius/2,
        y: bounds.maxY*CGFloat(color.saturation/100)-radius/2,
        width: radius,
        height: radius)
      
      let circle = UIBezierPath(ovalInRect: circleRect)
      color.color.setFill()
      circle.fill()
      circle.lineWidth = 3.0
      UIColor.blackColor().setStroke()
      circle.stroke()
    }
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    changeColorTo(touch: touches.first as? UITouch)
  }
  
  override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    changeColorTo(touch: touches.first as? UITouch)
  }
  
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    changeColorTo(touch: touches.first as? UITouch)
  }
  
  func changeColorTo(# touch:UITouch?) {
    if let contact = touch {
      changeColorTo(point: contact.locationInView(self))
    }
  }
  
  func changeColorTo(# point: CGPoint) {
    if let color = colorModel {
      let bounds = self.bounds
      if bounds.contains(point) {
        color.hue = Float((point.x-bounds.minX)/bounds.width*360)
        color.saturation = Float((point.y-bounds.minY)/bounds.height*100)
      }
    }
  }
}
