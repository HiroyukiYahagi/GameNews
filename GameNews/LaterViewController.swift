//
//  LaterViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/09/03.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class LaterViewController : ReloadableViewController, IndicatorInfoProvider{
    
    @IBOutlet weak var rankingButton: UIButton!
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "後で読む")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.loadButtonPressed()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func reload(){
        self.tableData = ArticleDao.findFavorite(LOADMODE.INTERVAL)
        self.tableView.reloadData()
    }
    
    override func getDisplayMode() -> DISPLAYMODE?{
        return DISPLAYMODE.LATER
    }
}