//
//  MovieViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/09/01.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//


import UIKit
import XLPagerTabStrip

class MovieViewController : ReloadableViewController, IndicatorInfoProvider{
    
    @IBOutlet weak var rankingButton: UIButton!
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "動画")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func reload(){
        self.tableData = ArticleDao.findMovie(LOADMODE.INTERVAL)
        self.tableView.reloadData()
    }
    
    override func getDisplayMode() -> DISPLAYMODE?{
        return DISPLAYMODE.MOVIE
    }
}