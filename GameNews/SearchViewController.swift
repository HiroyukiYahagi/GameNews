//
//  SearchViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/09/04.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var allData: [AnyObject]?
    var rankingData: [AnyObject]?
    var favoriteData: [AnyObject]?
    
    var allResults: [AnyObject]?
    var rankingResults: [AnyObject]?
    var favoriteResults: [AnyObject]?
    
    var displayMode: DISPLAYMODE?
    var mode:Bool?
    var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.registerNib(UINib(nibName: "CommonCustomCell", bundle: nil), forCellReuseIdentifier: "CommonCell")
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = true
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadData(){
        self.allData = ArticleDao.findAll(LOADMODE.NOLOAD)
        self.rankingData = ArticleDao.findRanking(LOADMODE.NOLOAD)
        self.favoriteData = ArticleDao.findFavorite(LOADMODE.NOLOAD)
    }
    
    //データを返すメソッド
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CommonCell", forIndexPath: indexPath)
        let article:Article? = self.getDataWithSectionId(indexPath.section)![indexPath.row] as? Article
        
        let contentView = cell.subviews[0]
        for view in contentView.subviews {
            switch view.tag {
            case 11:
                //title
                let label = view as? UILabel
                label?.text = article!.title
                break
            case 12:
                //site name
                let label = view as? UILabel
                if(article!.postDate != nil){
                    label?.text = CommonUtil.getDateFormatterJP().stringFromDate(article!.postDate!)
                }
                break
            case 1:
                //image
                let imageView = view as? UIImageView
                imageView?.image = article!.getImageData({ (uiImage) in
                    dispatch_async(dispatch_get_main_queue(), {
                        imageView?.image = uiImage
                    })
                })
                break
            case 30:
                let button = view as? UIButton
                if(PropertiesLoader.getMode() == "Prod"){
                    button?.hidden = true
                }else{
                    button?.hidden = false
                }
                break
            default:
                break
            }
        }
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        if(self.mode == nil){
            self.mode = true
        }else{
            self.dismissViewControllerAnimated(true, completion: {
            })
        }
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        
        if(searchController.searchBar.text == ""){
            return 0
        }else{
            return self.getDataWithSectionId(section) != nil ? self.getDataWithSectionId(section)!.count : 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "あとで読む"
        case 1:
            return "ランキング"
        case 2:
            return "全て"
        default:
            return nil
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let wvc = WebViewController()
        wvc.article = self.getDataWithSectionId(indexPath.section)![indexPath.row] as? Article
        self.presentedViewController?.presentViewController(wvc, animated: true, completion: nil)
    }
    
    func getDataWithSectionId(section:Int) -> [AnyObject]?{
        switch section {
        case 0:
            return self.favoriteResults
        case 1:
            return self.rankingResults
        case 2:
            return self.allResults
        default:
            return nil
        }
    }
    
    
    //検索文字列変更時の呼び出しメソッド
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        favoriteResults = nil
        rankingResults = nil
        allResults = nil
        
        if(searchController.searchBar.text == ""){
            tableView.reloadData()
            return
        }
        
        //検索文字列を含むデータを検索結果配列に格納する。
        favoriteResults = favoriteData!.filter { data in
            let article = data as! Article
            
            if ((article.title?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                return true
            }else{
                for obj in article.tags! {
                    let tag = obj as! Tag
                    if ((tag.name?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                        return true
                    }
                }
            }
            return false
        }
        
        rankingResults = rankingData!.filter { data in
            let article = data as! Article
            
            if ((article.title?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                return true
            }else{
                for obj in article.tags! {
                    let tag = obj as! Tag
                    if ((tag.name?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                        return true
                    }
                }
            }
            return false
        }
        
        allResults = allData!.filter { data in
            let article = data as! Article
            
            if ((article.title?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                return true
            }else{
                for obj in article.tags! {
                    let tag = obj as! Tag
                    if ((tag.name?.localizedCaseInsensitiveContainsString(searchController.searchBar.text!)) == true) {
                        return true
                    }
                }
            }
            return false
        }
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
