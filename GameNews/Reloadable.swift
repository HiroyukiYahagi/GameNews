//
//  Reloadable.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/31.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit

class ReloadableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activetyIndicator: UIActivityIndicatorView!
    
    var tableData:[AnyObject]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Cell名の登録をおこなう.
        self.tableView.registerNib(UINib(nibName: "CommonCustomCell", bundle: nil), forCellReuseIdentifier: "CommonCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ReloadableViewController.onRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadButtonPressed()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onRefresh(refreshControl:UIRefreshControl){
        refreshControl.beginRefreshing()
        loadButtonPressed()
        refreshControl.endRefreshing()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let wvc = WebViewController()
        wvc.article = self.getArticles()[indexPath.row] as? Article
        self.presentViewController(wvc, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData!.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func getCell(indexPath:NSIndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCellWithIdentifier("CommonCell", forIndexPath: indexPath)
    }
    
    func getArticles() -> [AnyObject]{
        return self.tableData!
    }
    
    func getArticle(indexPath:NSIndexPath) -> Article{
        return tableData![indexPath.row] as! Article
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.getCell(indexPath)
        let article:Article = self.getArticle(indexPath)
        
        let contentView = cell.subviews[0]
        for view in contentView.subviews {
            switch view.tag {
            case 11:
                //title
                let label = view as? UILabel
                label?.text = article.title
                break
            case 12:
                //site name
                let label = view as? UILabel
                if(article.site?.name != nil){
                    label?.text = article.site?.name
                }
                break
            case 1:
                //image
                let imageView = view as? UIImageView
                imageView?.image = article.getImageData({ (uiImage) in
                    dispatch_async(dispatch_get_main_queue(), {
                        imageView?.image = uiImage
                    })
                })
                break
            default:
                let button = view as? UIButton
                button?.tag = 30 + indexPath.row
                button?.addTarget(self, action: #selector(self.deleteButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                if(PropertiesLoader.getMode() == "Prod"){
                    button?.hidden = true
                }else{
                    button?.hidden = false
                }
                break
            }
        }
        return cell
    }
    
    func deleteButtonPressed(sender: UIButton){
        let indexPath = sender.tag - 30
        let deletedData = self.tableData![indexPath] as! Article
        
        let alert:UIAlertController = UIAlertController(title: "削除", message: "データを削除し管理者へ通報します。\nよろしいですか？", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{ alertAction in
            ArticleDao.delete(deletedData)
            self.loadButtonPressed()
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.Default, handler:nil))
        self.presentViewController(alert, animated: true, completion: {
        })
    }
    
    func loadButtonPressed(){
        preReload()
        reload()
        postReload()
    }
    
    func preReload(){
        self.loadingView.hidden = false
        self.activetyIndicator.startAnimating()
    }
    
    func reload(){
        self.tableData = ArticleDao.findNews(LOADMODE.INTERVAL)
        self.tableView.reloadData()
    }
    
    func postReload(){
        self.loadingView.hidden = true
        self.activetyIndicator.stopAnimating()
    }
    
    func getDisplayMode() -> DISPLAYMODE?{
        return nil
    }
}