//
//  JSONParser.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation

class JSONParser {
    
    static let timeOut:NSInteger = PropertiesLoader.getProperties("Timeout") as! NSInteger
    
    static func parse(urlString: String, callback:(NSDictionary?)->Void ) {
        let url = NSURL(string: urlString)!
        let myRequest:NSURLRequest  = NSURLRequest(URL: url)
        let data:NSData = try! NSURLConnection.sendSynchronousRequest(myRequest, returningResponse: nil)
        let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
        if(dict != nil){
            callback(dict!)
        }
    }
    
    static func asyncParse(urlString: String, callback:(NSDictionary?)->Void ) {
        let url = NSURL(string: urlString)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
            // conver json to dictionary
            let dict = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            callback(dict)
        })
        task.resume()
    }
}