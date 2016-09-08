//
//  ColorPallet.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit

class ColorPallete{
    
    static var mainColor: UIColor!
    static var subColor: UIColor!
    
    static func getMainColor() -> UIColor{
        if(ColorPallete.mainColor == nil){
            ColorPallete.mainColor = ColorPallete.uiColorFromPropertieName("ThemeColor")
        }
        return ColorPallete.mainColor
    }
    
    static func getSubColor() -> UIColor{
        if(ColorPallete.subColor == nil){
            ColorPallete.subColor = ColorPallete.uiColorFromPropertieName("ThemeColorSub")
        }
        return ColorPallete.subColor
    }
    
    private static func uiColorFromPropertieName(name:String) -> UIColor{
        let red:NSNumber = PropertiesLoader.getProperties(name + ".Red") as! NSNumber
        let green:NSNumber = PropertiesLoader.getProperties(name + ".Green") as! NSNumber
        let blue:NSNumber = PropertiesLoader.getProperties(name + ".Blue") as! NSNumber
        return UIColor(red: CGFloat(red.doubleValue/255), green: CGFloat(green.doubleValue/255), blue: CGFloat(blue.doubleValue/255), alpha: 1)
    }
    
    static func getGoldColor() -> UIColor{
        return UIColor(red: CGFloat(255.0/255), green: CGFloat(215.0/255), blue: CGFloat(0.0/255), alpha: 1)
    }
    
    static func getSilverColor() -> UIColor{
        return UIColor(red: CGFloat(192.0/255), green: CGFloat(192.0/255), blue: CGFloat(192.0/255), alpha: 1)
    }
    
    static func getBronzeColor() -> UIColor{
        return UIColor(red: CGFloat(196.0/255), green: CGFloat(112.0/255), blue: CGFloat(34.0/255), alpha: 1)
    }
}