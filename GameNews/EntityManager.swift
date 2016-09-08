//
//  EntityManager.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import CoreData

class EntityManager {
    
    static private func getManagedObjectContext() -> NSManagedObjectContext{
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDel.managedObjectContext
    }
    
    static func getFetchedResultsController(entityName:String, predicate:NSPredicate?, sorts:[NSSortDescriptor]?) -> NSFetchedResultsController{
        
        let context:NSManagedObjectContext = getManagedObjectContext()
        let entityDiscription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context);
        
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDiscription
        if(predicate != nil){
            fetchRequest.predicate = predicate
        }
        if(sorts != nil){
            fetchRequest.sortDescriptors = sorts
        }else{
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        }
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    static func getData(entityName:String, predicate:NSPredicate?, sorts:[NSSortDescriptor]?) -> [NSManagedObject]{
        
        let context:NSManagedObjectContext = getManagedObjectContext()
        let entityDiscription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context);
        
        let fetchRequest = NSFetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.entity = entityDiscription
        if(predicate != nil){
            fetchRequest.predicate = predicate
        }
        if(sorts != nil){
            fetchRequest.sortDescriptors = sorts
        }else{
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        }
        
        return try! context.executeFetchRequest(fetchRequest) as! [NSManagedObject]
    }
    
    static func getAData(entityName:String, key:NSNumber? = nil) -> NSManagedObject{
        let context:NSManagedObjectContext = getManagedObjectContext()
        let entityDiscription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context);
        
        if(key == nil){
            return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context)
        }else{
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entityDiscription
            fetchRequest.returnsObjectsAsFaults = false
            fetchRequest.predicate = NSPredicate(format: "id == %@", (key?.stringValue)!)
            let results:[NSManagedObject] = try! context.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if(results.count > 0){
                return results[0];
            }else{
                let entity: NSManagedObject! = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context)
                    entity.setValue(key, forKey: "id")
                return entity
            }
        }
    }
    
    static func save(){
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDel.saveContext()
    }
    
    static func delete(object: NSManagedObject){
        let context: NSManagedObjectContext = getManagedObjectContext()
        context.deleteObject(object)
        save()
    }
    
}