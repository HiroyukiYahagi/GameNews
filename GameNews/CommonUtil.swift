//
//  CommonUtil.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/30.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation

class CommonUtil {
    
    private static var dateFormatterJP:NSDateFormatter?
    private static var dateFormatterJPDate:NSDateFormatter?
    private static var dateFormatterJPTime:NSDateFormatter?
    
    static func getDateFormatterJP() -> NSDateFormatter{
        if(CommonUtil.dateFormatterJP == nil){
            CommonUtil.dateFormatterJP = NSDateFormatter()
            CommonUtil.dateFormatterJP?.locale = NSLocale(localeIdentifier: "ja_JP")
            CommonUtil.dateFormatterJP?.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return CommonUtil.dateFormatterJP!
    }
    
    static func getDateFormatterJPDate() -> NSDateFormatter{
        if(CommonUtil.dateFormatterJPDate == nil){
            CommonUtil.dateFormatterJPDate = NSDateFormatter()
            CommonUtil.dateFormatterJPDate?.locale = NSLocale(localeIdentifier: "ja_JP")
            CommonUtil.dateFormatterJPDate?.dateFormat = "yyyy-MM-dd"
        }
        return CommonUtil.dateFormatterJPDate!
    }
    
    static func getDateFormatterJPTime() -> NSDateFormatter{
        if(CommonUtil.dateFormatterJPTime == nil){
            CommonUtil.dateFormatterJPTime = NSDateFormatter()
            CommonUtil.dateFormatterJPTime?.locale = NSLocale(localeIdentifier: "ja_JP")
            CommonUtil.dateFormatterJPTime?.dateFormat = "HH:mm:ss"
        }
        return CommonUtil.dateFormatterJPTime!
    }
    
    static func getContentsFromUrl(url:String?, complete:(NSData?, NSURLResponse?, NSError?)->Void ){
        if(url == nil){
            return
        }
        let url:NSURL = NSURL(string: url!)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, urlResponse, error) in
            complete(data, urlResponse, error)
        }
        task.resume()
    }
    
    static func margeDictionaries(base:NSDictionary, override:NSDictionary) -> NSDictionary?{
        let newDic:NSMutableDictionary = base.mutableCopy() as! NSMutableDictionary
        for (key, overrideValue) in override {
            var newData:AnyObject? = overrideValue
            let baseValue = base.valueForKey(key as! String)
            if baseValue is NSDictionary && overrideValue is NSDictionary{
                newData = margeDictionaries(baseValue as! NSDictionary, override: overrideValue as! NSDictionary)
            }
            newDic.setValue(newData, forKey: key as! String)
        }
        return newDic
    }
    
    
}