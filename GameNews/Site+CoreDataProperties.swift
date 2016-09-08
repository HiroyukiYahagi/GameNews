//
//  Site+CoreDataProperties.swift
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

extension Site {

    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var image: String?
    @NSManaged var imageData: NSData?
    @NSManaged var url: String?
    @NSManaged var category: Category?
    @NSManaged var articles: NSMutableSet?

    internal func addArticle(article:Article){
        if(self.articles == nil){
            self.articles = NSMutableSet()
        }
        self.articles?.addObject(article)
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
        self.name = dic.valueForKey("name") as? String
        self.setImageAndClearData(dic.valueForKey("image") as? String)
        self.url = dic.valueForKey("url") as? String
        
        let categoryDic:NSDictionary? = dic.valueForKey("category") as? NSDictionary
        if(categoryDic != nil ){
            let site_id: NSNumber? = categoryDic?.valueForKey("id") as? NSNumber
            let category: Category = EntityManager.getAData("Category", key: site_id) as! Category
            category.patchDictionary(categoryDic!)
            category.addSite(self)
            self.category = category
            EntityManager.save()
        }
        
    }
}
