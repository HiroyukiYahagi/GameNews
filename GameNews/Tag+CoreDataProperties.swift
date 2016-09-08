//
//  Tag+CoreDataProperties.swift
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

extension Tag {

    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var color: String?
    @NSManaged var articles: NSMutableSet?

    internal func addArticle(article:Article){
        if(self.articles == nil){
            self.articles = NSMutableSet()
        }
        self.articles?.addObject(article)
    }
    
    internal func patchDictionary(dic:NSDictionary){
        self.id = dic.valueForKey("id") as? NSNumber
        self.name = dic.valueForKey("name") as? String
        self.color = dic.valueForKey("color") as? String
    }
}
