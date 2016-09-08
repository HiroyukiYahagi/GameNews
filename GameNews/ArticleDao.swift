//
//  NewsDao.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation
import CoreData

class ArticleDao {
    
    static let interval:Double = PropertiesLoader.getProperties("LoadInterval") as! Double
    static let rankingMax:NSInteger = PropertiesLoader.getProperties("RankingMax") as! NSInteger
    static let deleteInterval:Double = PropertiesLoader.getProperties("DeleteInterval") as! Double
    
    static func findAll(loadMode:LOADMODE) -> [NSManagedObject] {
        if(ArticleDao.shouldLoad(loadMode)){
            ArticleDao.load({ (dic) -> Void in
                return
            })
        }
        let sort:NSSortDescriptor = NSSortDescriptor(key: "postDate", ascending: false)
        return EntityManager.getData("Article", predicate:nil, sorts: [sort])
    }
    
    static func findNews(loadMode:LOADMODE) -> [NSManagedObject] {
        return ArticleDao.findAll(loadMode)
    }
    
    static func findMovie(loadMode:LOADMODE) -> [NSManagedObject] {
        if(ArticleDao.shouldLoad(loadMode)){
            ArticleDao.load({ (dic) -> Void in
                return
            })
        }
        let movieTag = EntityManager.getAData("Tag", key: 0) as! Tag
        let movieArticlesSet = movieTag.articles
        let sort = NSSortDescriptor(key: "postDate", ascending: false)
        return movieArticlesSet?.sortedArrayUsingDescriptors([sort]) as! [NSManagedObject]
    }
    
    static func findRanking(loadMode:LOADMODE) -> [NSManagedObject] {
        if(ArticleDao.shouldLoad(loadMode)){
            ArticleDao.load({ (dic) -> Void in
                return
            })
        }
        let predicate:NSPredicate = NSPredicate(format: "ranking <= %d", ArticleDao.rankingMax + 1)
        let sort:NSSortDescriptor = NSSortDescriptor(key: "ranking", ascending: true)
        return EntityManager.getData("Article", predicate:predicate, sorts: [sort])
    }
    
    static func findFavorite(loadMode:LOADMODE) -> [NSManagedObject] {
        if(ArticleDao.shouldLoad(loadMode)){
            ArticleDao.load({ (dic) -> Void in
                return
            })
        }
        let predicate:NSPredicate = NSPredicate(format: "favorite == true")
        let sort:NSSortDescriptor = NSSortDescriptor(key: "postDate", ascending: false)
        return EntityManager.getData("Article", predicate:predicate, sorts: [sort])
    }
    
    static func shouldLoad(loadMode:LOADMODE) -> Bool{
        if(loadMode == LOADMODE.LOAD){
            return true
        }else if(loadMode == LOADMODE.NOLOAD){
            return false
        }
        
        let lastUpdate = PropertiesLoader.getLastUpdate()
        let now:NSDate = NSDate(timeInterval: ArticleDao.interval*(-1), sinceDate: NSDate())
        if(lastUpdate.compare(now) == NSComparisonResult.OrderedAscending){
            return true
        }else{
            return false
        }
    }
    
    static func load(){
        ArticleDao.load() { (dic) -> Void? in
            return
        }
    }
    
    static func load(complete:(NSDictionary)->Void?) {
        let mode:String = PropertiesLoader.getMode()
        var url:String = PropertiesLoader.getProperties(mode + "Urls.NewArticle") as! String
        
        let lastUpdate = PropertiesLoader.getLastUpdate()
        
        url = url.stringByAppendingString("?")
        
        url = url.stringByAppendingString("date=")
        url = url.stringByAppendingString(CommonUtil.getDateFormatterJPDate().stringFromDate(lastUpdate))
        
        url = url.stringByAppendingString("&time=")
        url = url.stringByAppendingString(CommonUtil.getDateFormatterJPTime().stringFromDate(lastUpdate))
        
        
        //最新のニュースを取得
        JSONParser.parse(url) { (dic) in
            let articlesDic = dic!.valueForKey("article") as! [NSDictionary]
            for articleDic:NSDictionary in articlesDic{
                let article:Article = EntityManager.getAData("Article") as! Article
                article.patchDictionary(articleDic)
            }
            EntityManager.save()
        }
        
        //ランキング情報を取得
        url = PropertiesLoader.getProperties(mode + "Urls.RankingArticle") as! String
        JSONParser.parse(url) { (dic) in
            //ランキング情報をリセット
            ArticleDao.resetRanking()
            
            //ランキング情報からarticle表のアップデート
            let rankingArr:[NSDictionary] = (dic?.valueForKey("ranking") as? [NSDictionary])!
            for rankingDic:NSDictionary in rankingArr{
                let ranking = rankingDic.valueForKey("id") as! NSNumber
                let aritcleId = rankingDic.valueForKey("aritcle_id") as! NSNumber
                let article:Article? = EntityManager.getAData("Article", key: aritcleId) as? Article
                article?.ranking = ranking
            }
            //セーブ
            EntityManager.save()
            complete(dic!)
        }

        PropertiesLoader.updateLastUpdate()
    }
    
    static func update(article: Article){
        EntityManager.save()
    }

    static func delete(article: Article){
        EntityManager.delete(article)
    }
    
    static func resetRanking(){
        let all:[NSManagedObject] = ArticleDao.findRanking(LOADMODE.NOLOAD)
        for obj:NSManagedObject in all {
            obj.setValue(1000, forKey: "ranking")
        }
        EntityManager.save()
    }
    
    static func deleteOldArticles(){
        let targetedDay :NSDate = NSDate(timeIntervalSinceNow:(-1*deleteInterval))
        dump(targetedDay)
        let predicate:NSPredicate = NSPredicate(format: "postDate <= %@", targetedDay)
        let deletedData = EntityManager.getData("Article", predicate: predicate, sorts: nil)
        for data in deletedData {
            EntityManager.delete(data)
        }
        EntityManager.save()
    }

}

enum LOADMODE {
    case NOLOAD
    case LOAD
    case INTERVAL
}