//
//  TabViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/19.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class MyTabViewController: ButtonBarPagerTabStripViewController {
    
    var childViewController: UIViewController? = nil
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var titleLabel: UILabel!
    
    override internal func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [NewsViewController(),MovieViewController(),LaterViewController()]
    }
    
    override func viewDidLoad() {
        
        settings.style.buttonBarBackgroundColor = .whiteColor()
        settings.style.buttonBarItemBackgroundColor = .clearColor()
        settings.style.selectedBarBackgroundColor = ColorPallete.getMainColor()
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = ColorPallete.getMainColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        settings.style.buttonBarItemFont = UIFont.systemFontOfSize(CGFloat(15), weight: UIFontWeightBold)
        
        super.viewDidLoad()
        buttonBarView.selectedBar.translatesAutoresizingMaskIntoConstraints = true;
        buttonBarView.selectedBar.frame.origin.y = 46;
        
        titleLabel.text = PropertiesLoader.getProperties("Title.Text") as? String
        titleLabel.textColor = ColorPallete.getMainColor()
        
        refreshButton.tintColor = ColorPallete.getMainColor()
        searchButton.tintColor = ColorPallete.getMainColor()
        
        ArticleDao.deleteOldArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pagerTabStripViewController(pagerTabStripViewController: PagerTabStripViewController, updateIndicatorFromIndex fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.pagerTabStripViewController(pagerTabStripViewController, updateIndicatorFromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        
        if(toIndex >= 0 && toIndex < viewControllers.count){
            self.childViewController = viewControllers[toIndex]
            if (self.childViewController as? ReloadableViewController) == nil {
                self.refreshButton.enabled = false
                self.searchButton.enabled = false
                if(indexWasChanged){
                    (self.childViewController as! ReloadableViewController).loadButtonPressed()
                }
            } else {
                self.refreshButton.enabled = true
                self.searchButton.enabled = true
            }
        }
    }
    
    @IBAction func searchButtonPressed(sender: AnyObject) {
        let svc = SearchViewController()
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func settingButtonPressed(sender: AnyObject) {
        let svc = SettingViewController()
        self.presentViewController(svc, animated: true, completion: nil)
    }
}