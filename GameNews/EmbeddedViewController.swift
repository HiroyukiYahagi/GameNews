//
//  EmbeddedViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/19.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class EmbeddedViewController : UIViewController, IndicatorInfoProvider{
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Child title")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}