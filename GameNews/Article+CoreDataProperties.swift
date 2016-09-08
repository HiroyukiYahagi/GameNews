//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData
import UIKit

extension Article {

    @NSManaged var id: NSNumber?
    @NSManaged var title: String?
    @NSManaged var image: String?
    @NSManaged var imageData: NSData?
    @NSManaged var url: String?
    @NSManaged var content: String?
    @NSManaged var postDate: NSDate?
    @NSManaged var site: Site?
    @NSManaged var tags: NSMutableSet?
    @NSManaged var ranking: NSNumber?
    @NSManaged var favorite: NSNumber?
    
    internal func addTag(tag:Tag){
        if(self.tags == nil){
            self.tags = NSMutableSet()
        }
        self.tags?.addObject(tag)
    }
    
    internal func setImageAndClearData(image:String?){
        if(self.image != image){
            self.imageData = nil
            self.image = image
        }
    }
    
    internal func getImageData(complete:(UIImage)->Void) -> UIImage?{
        if(self.imageData == nil){
            CommonUtil.getContentsFromUrl(self.image, complete: { (data, response, error) in
                if(data == nil){
                    return
                }
                self.imageData = data
                let uiImage:UIImage = UIImage(data: data!)!
                complete(uiImage)
            })
            return UIImage(named: PropertiesLoader.getProperties("NoImage") as! String )
        }else{
            let uiImage:UIImage = UIImage(data: self.imageData!)!
            return uiImage
        }
    }
    
    internal func patchDictionary(dic:NSDictionary){
        
        self.id = dic.valueForKey("id") as? NSNumber
        self.title = dic.valueForKey("title") as? String
        self.url = dic.valueForKey("url") as? String
        self.setImageAndClearData(dic.valueForKey("image") as? String)
        
        let post_date:String = dic.valueForKey("post_date") as! String
        self.postDate = CommonUtil.getDateFormatterJP().dateFromString(post_date)
        
        let tagArr:[NSDictionary]? = dic.valueForKey("tag") as? [NSDictionary]
        
        if(tagArr != nil && tagArr?.count > 0 ){
            for tagDic:NSDictionary in tagArr! {
                let tag_id:NSNumber? = tagDic.valueForKey("id") as? NSNumber
                let tag: Tag = EntityManager.getAData("Tag", key: tag_id) as! Tag
                tag.patchDictionary(tagDic)
                tag.addArticle(self)
                self.addTag(tag)
                EntityManager.save()
            }
        }
        
        let siteDic:NSDictionary? = dic.valueForKey("site") as? NSDictionary
        if(siteDic != nil ){
            let site_id: NSNumber? = siteDic?.valueForKey("id") as? NSNumber
            let site: Site = EntityManager.getAData("Site", key: site_id) as! Site
            site.patchDictionary(siteDic!)
            site.addArticle(self)
            self.site = site
            EntityManager.save()
        }
    }
}
