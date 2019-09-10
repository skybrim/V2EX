//
//  UIUtils.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/10.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import UIKit

public let TextBlack = 0x333333
public let TextDarkGray = 0x666666
public let TextGray = 0x999999
public let BaseBackground = 0xf5f5f5


extension UIFont {
    static func registerFont(fontName: String) {
        if let url = Bundle.main.url(forResource: fontName, withExtension: "ttf"),
            let fontDataProvider = CGDataProvider(url: url as NSURL),
            let newFont = CGFont(fontDataProvider) {
            CTFontManagerRegisterGraphicsFont(newFont, nil)
        }
    }
}

extension UIImage {
    static func image(iconCode: String, fontName: String, size: CGFloat, color: UIColor) -> UIImage? {
        let imageSize = CGSize(width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size, height: size))
        label.font = UIFont(name: fontName, size: size)
        label.text = iconCode
        label.textColor = color
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let retImage = UIGraphicsGetImageFromCurrentImageContext()
        return retImage
    }
}

/*
 + (UIImage*)imageWithIcon:(NSString*)iconCode inFont:(NSString*)fontName size:(NSUInteger)size color:(UIColor*)color {
 CGSize imageSize = CGSizeMake(size, size);
 UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
 UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size, size)];
 label.font = [UIFont fontWithName:fontName size:size];
 label.text = iconCode;
 if(color){
 label.textColor = color;
 }
 [label.layer renderInContext:UIGraphicsGetCurrentContext()];
 UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
 return retImage;
 }

 + (void)registerFontWithURL:(NSURL *)url {
 NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
 CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
 CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
 CGDataProviderRelease(fontDataProvider);
 CTFontManagerRegisterGraphicsFont(newFont, nil);
 CGFontRelease(newFont);
 }
 
 + (UIFont *)fontWithSize:(CGFloat)size {
 UIFont *font = [UIFont fontWithName:[self fontName] size:size];
 if (font == nil) {
 [self registerFontWithURL: [[NSBundle mainBundle] URLForResource:[self fontName] withExtension:@"ttf"]];
 font = [UIFont fontWithName:[self fontName] size:size];
 NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
 }
 return font;
 }
 
 */

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
    static func color(_ hex: Int, _ alpha: CGFloat = 1) -> UIColor {
        let red = CGFloat(((hex & 0xff0000) >> 16)) / 255.0
        let green = CGFloat(((hex & 0xff00) >> 8)) / 255.0
        let blue = CGFloat(((hex & 0xff))) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIView {
    //画线
    private func drawBorder(rect: CGRect, color: UIColor){
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    //设置右边框
    public func rightBorder(width: CGFloat, borderColor: UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.width - width, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置左边框
    public func leftBorder(width: CGFloat, borderColor: UIColor){
        let rect = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置上边框
    public func topBorder(width: CGFloat, borderColor: UIColor){
        let rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
    
    //设置底边框
    public func bottomBorder(width: CGFloat, borderColor: UIColor){
        let rect = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
}
