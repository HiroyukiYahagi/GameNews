//
//  TestWebViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/09/04.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import WebKit

class TestWebViewController: UIViewController {

    var _webkitview: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //3.WebKitのインスタンス作成!
        self._webkitview = WKWebView()
        
        //4.ここでWebKitをviewに紐付け
        self.view = self._webkitview!
        
        //5.URL作って、表示させる！
        let url = NSURL(string:"http://www.yahoo.co.jp/")
        let req = NSURLRequest(URL:url!)
        self._webkitview!.loadRequest(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
