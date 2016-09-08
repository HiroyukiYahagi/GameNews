//
//  AccessLogDao.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/30.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation

class AccessLogDao {
    
    static func asyncSendAccessLog(article_id:NSNumber, action:ACTIONMODE, attribute:String){
        
        let mode:String = PropertiesLoader.getMode()
        var url:String = PropertiesLoader.getProperties(mode + "Urls.AccessLog") as! String
        
        url = url.stringByAppendingString("?")
        let lastUpdate = NSDate()
        url = url.stringByAppendingString("date=")
        url = url.stringByAppendingString(CommonUtil.getDateFormatterJPDate().stringFromDate(lastUpdate))
        
        url = url.stringByAppendingString("&time=")
        url = url.stringByAppendingString(CommonUtil.getDateFormatterJPTime().stringFromDate(lastUpdate))
        
        url = url.stringByAppendingString("&idfa=")
        url = url.stringByAppendingString(PropertiesLoader.getIDFA())
        
        url = url.stringByAppendingString("&article_id=")
        url = url.stringByAppendingString(article_id.stringValue)
        
        url = url.stringByAppendingString("&action=")
        url = url.stringByAppendingFormat("%d", action.hashValue)
        
        url = url.stringByAppendingString("&attribute=")
        url = url.stringByAppendingString(attribute)
        
        
        let request:NSURLRequest = NSURLRequest(URL: NSURL(string: url)!)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, err) in }
        task.resume()
    }
}

enum ACTIONMODE{
    case SEE
    case READ
    case FAVORITE
    case DELETE
}