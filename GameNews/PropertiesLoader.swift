//
//  PropertiesLoader.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation
import AdSupport

class PropertiesLoader {
    
    static let modeType:String = "Mode"
    static let lastUpdateType:String = "lastUpdate"
    static let fileName:String = "settings.plist"
//    static var baseDic:NSDictionary?
    
    static func getProperties(propertyName:String) -> AnyObject{
        let ud:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var settingDic:NSDictionary? = ud.valueForKey("settings") as? NSDictionary
        if(settingDic == nil){
            let filePath = NSBundle.mainBundle().pathForResource(PropertiesLoader.fileName, ofType:nil )
            settingDic = NSDictionary(contentsOfFile:filePath!)!
        }
        let arr = propertyName.componentsSeparatedByString(".")
        var dic:AnyObject? = settingDic
        for name in arr {
            dic = dic?.valueForKey(name)
        }
        return dic!
    }
    
    static func getLastUpdate() -> NSDate{
        let ud:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var lastUpdate:NSDate? = ud.valueForKey(PropertiesLoader.lastUpdateType) as? NSDate
        
        if(lastUpdate == nil){
            lastUpdate = NSDate(timeInterval: -60*60*24*30, sinceDate: NSDate())
            ud.setValue(lastUpdate, forKey: PropertiesLoader.lastUpdateType)
        }
        return lastUpdate!
    }
    
    static func updateLastUpdate(){
        let ud:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let now = NSDate()
        ud.setValue(now, forKey: PropertiesLoader.lastUpdateType)
    }
    
    static func getMode() -> String{
        return PropertiesLoader.getProperties(modeType) as! String
    }
    
    static func getIDFA() -> String{
        let identifierManager:ASIdentifierManager = ASIdentifierManager.sharedManager()
        if identifierManager.advertisingTrackingEnabled {
            return identifierManager.advertisingIdentifier.UUIDString;
        }else{
            return "NoIDFA"
        }
    }
    
    static func load(){
        let url:String = PropertiesLoader.getProperties("CommonUrls.GetSetting") as! String
        let ud:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var settingDic:NSDictionary? = ud.valueForKey("settings") as? NSDictionary
        if(settingDic == nil){
            let filePath = NSBundle.mainBundle().pathForResource(PropertiesLoader.fileName, ofType:nil )
            settingDic = NSDictionary(contentsOfFile:filePath!)!
        }
        JSONParser.parse(url) { (dic) in
            if(dic == nil){
                return
            }
            settingDic = CommonUtil.margeDictionaries(settingDic!, override: (dic?.valueForKey("settings")!) as! NSDictionary)
        }
        ud.setValue(settingDic, forKey: "settings")
    }
}