//
//  Utils.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/4.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import UIKit

public let TextBlack = "#333333"
public let TextDarkGray = "#666666"
public let TextGray = "#999999"

extension CGFloat {
    public static var screenWidth: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    
    public static var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    public static var masterWidth: CGFloat {
        get {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let splitVC = appDelegate.window?.rootViewController as! UISplitViewController
                return splitVC.primaryColumnWidth
            }
            return CGFloat.screenWidth
        }
    }
    
    public static var detailWidth: CGFloat {
        get {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let splitVC = appDelegate.window?.rootViewController as? UISplitViewController {
                return CGFloat.screenWidth == splitVC.primaryColumnWidth ? CGFloat.screenWidth : CGFloat.screenWidth - splitVC.primaryColumnWidth
            }
            return CGFloat.screenWidth
        }
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])
            if hexColor.count == 6 {
                hexColor += "ff"
            }
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

extension UIView {
    //画线
    private func drawBorder(rect:CGRect,color:UIColor){
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    //设置右边框
    public func rightBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.width - width, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置左边框
    public func leftBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置上边框
    public func topBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置底边框
    public func buttomBorder(width:CGFloat,borderColor:UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
}
