//
//  NewsViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/28.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class NewsViewController : ReloadableViewController, IndicatorInfoProvider{

    @IBOutlet weak var rankingButton: UIButton!

    var rankingData:[AnyObject]?
    var mode:DISPLAYMODE = DISPLAYMODE.LATEST
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ニュース")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerNib(UINib(nibName: "RankCell", bundle: nil), forCellReuseIdentifier: "RankCell")
        
        // Cell名の登録をおこなう.
        rankingButton.layer.cornerRadius = 25
        rankingButton.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        rankingButton.layer.shadowOpacity = 0.5
        rankingButton.backgroundColor = ColorPallete.getMainColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func getCell(indexPath:NSIndexPath) -> UITableViewCell{
        if(self.mode == DISPLAYMODE.LATEST){
            return tableView.dequeueReusableCellWithIdentifier("CommonCell", forIndexPath: indexPath)
        }else{
            return tableView.dequeueReusableCellWithIdentifier("RankCell", forIndexPath: indexPath)
        }
    }
    
    override func getArticles() -> [AnyObject]{
        if(self.mode == DISPLAYMODE.LATEST){
            return tableData!
        }else{
            return rankingData!
        }
    }
    
    override func getArticle(indexPath:NSIndexPath) -> Article{
        return self.getArticles()[indexPath.row] as! Article
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getArticles().count
    }
    
    @IBAction func rankingButtonPressed(sender: AnyObject) {
        if(self.mode == DISPLAYMODE.LATEST){
            self.mode = DISPLAYMODE.RANKING
            self.rankingButton.setImage(UIImage(named: "news.png"),forState: UIControlState.Normal)
        }else{
            self.mode = DISPLAYMODE.LATEST
            self.rankingButton.setImage(UIImage(named: "ranking.png"), forState: UIControlState.Normal)
        }
        self.loadButtonPressed()
    }
    
    override func reload(){        
        if(self.mode == DISPLAYMODE.LATEST){
            self.tableData = ArticleDao.findNews(LOADMODE.INTERVAL)
        }else{
            self.rankingData = ArticleDao.findRanking(LOADMODE.INTERVAL)
        }
        self.tableView.reloadData()
    }
    
    override func getDisplayMode() -> DISPLAYMODE?{
        return self.mode
    }
}

enum DISPLAYMODE{
    case LATEST
    case RANKING
    case MOVIE
    case LATER
}