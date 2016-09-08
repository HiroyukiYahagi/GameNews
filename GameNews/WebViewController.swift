//
//  WebViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import XLActionController
import Social
import WebKit

class WebViewController : UIViewController, WKNavigationDelegate{
    
    
    @IBOutlet weak var closeButton: UIButton!
    //@IBOutlet weak var webView: UIWebView!
    var webView: WKWebView! = WKWebView()
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    @IBOutlet weak var safariButton: UIBarButtonItem!
    @IBOutlet weak var progressView: UIProgressView!
    
    var article: Article?
    var startTimeStamp: NSTimeInterval?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        closeButton.layer.cornerRadius = 25
        closeButton.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        closeButton.layer.shadowOpacity = 0.5
        closeButton.backgroundColor = ColorPallete.getMainColor()
        
        backButton.tintColor = ColorPallete.getMainColor()
        actionButton.tintColor = ColorPallete.getMainColor()
        safariButton.tintColor = ColorPallete.getMainColor()
        
        progressView.progressTintColor = ColorPallete.getMainColor()
        
        self.setupWebView()
        
        let url: NSURL = NSURL(string:article!.url!)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
        self.startTimeStamp = NSDate().timeIntervalSince1970
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        //読み込み状態が変更されたことを取得
        self.webView.addObserver(self, forKeyPath: "loading", options: .New, context: nil)
        //プログレスが変更されたことを取得
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    override func viewWillDisappear(animated: Bool){
        super.viewWillDisappear(animated)
        //遷移前に消さないと、アプリが落ちる
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView.removeObserver(self, forKeyPath: "loading")
        
        //アクセスログの送信
        let endTimeStamp:NSTimeInterval = NSDate().timeIntervalSince1970
        AccessLogDao.asyncSendAccessLog((article?.id)!, action: ACTIONMODE.READ, attribute: String(endTimeStamp.hashValue - (startTimeStamp?.hashValue)!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupWebView(){
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView)
        self.view.addConstraints([
                NSLayoutConstraint(
                    item: self.webView,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint(
                    item: self.webView,
                    attribute: NSLayoutAttribute.Bottom,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.Bottom,
                    multiplier: 1.0,
                    constant: 44
                ),
                NSLayoutConstraint(
                    item: self.webView,
                    attribute: NSLayoutAttribute.Leading,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.Leading,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint(
                    item: self.webView,
                    attribute: NSLayoutAttribute.Trailing,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.Trailing,
                    multiplier: 1.0,
                    constant: 0
                )
                ])
        self.webView.allowsBackForwardNavigationGestures = true
        
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func safariButtonPressed(sender: AnyObject) {
        let url: NSURL = NSURL(string:article!.url!)!
        if UIApplication.sharedApplication().canOpenURL(url){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let actionController = TwitterActionController()
        
        actionController.addAction(Action(ActionData(title: "Facebookでシェアする", image: UIImage(named: "facebook.png")!), style: .Default, handler: { action in
            self.shareFacebook()
        }))
        actionController.addAction(Action(ActionData(title: "Twitterでシェアする", image: UIImage(named: "twitter.png")!), style: .Default, handler: { action in
            self.shareTwitter()
        }))
        if(self.article?.favorite?.boolValue == false){
            actionController.addAction(Action(ActionData(title: "「あとで見る」に登録する", image: UIImage(named: "light.jpg")!), style: .Default, handler: { action in
                self.article?.favorite = NSNumber(bool: true)
                EntityManager.save()
                AccessLogDao.asyncSendAccessLog((self.article?.id)!, action: ACTIONMODE.FAVORITE, attribute: "1")
            }))
        }else{
            actionController.addAction(Action(ActionData(title: "「あとで見る」から解除する", image: UIImage(named: "light.jpg")!), style: .Default, handler: { action in
                self.article?.favorite = NSNumber(bool: false)
                EntityManager.save()
                AccessLogDao.asyncSendAccessLog((self.article?.id)!, action: ACTIONMODE.FAVORITE, attribute: "-1")
            }))
            
        }
        presentViewController(actionController, animated: true, completion: nil)
    }
    
    private func shareFacebook(){
        let text = (article?.title)! + " : " + (PropertiesLoader.getProperties("Self") as! String);
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        composeViewController.setInitialText(text)
        self.presentedViewController?.dismissViewControllerAnimated(true, completion: {
            self.presentViewController(composeViewController, animated: true, completion: nil)
        })
    }
    
    private func shareTwitter(){
        let text = (article?.title)! + " : " + (PropertiesLoader.getProperties("Self") as! String);
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        self.presentedViewController?.dismissViewControllerAnimated(true, completion: {
            self.presentViewController(composeViewController, animated: true, completion: nil)
        })
    }
    
//    private func shareInstagram(){
//    }
//    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress"{
            //estimatedProgressが変更されたときに、setProgressを使ってプログレスバーの値を変更する。
            self.progressView.setProgress(Float(self.webView.estimatedProgress), animated: true)
        }else if keyPath == "loading"{
            //インジゲーターの表示、非表示をきりかえる。
            UIApplication.sharedApplication().networkActivityIndicatorVisible = self.webView.loading
            if self.webView.loading{
                self.progressView.setProgress(0.1, animated: true)
            }else{
                self.progressView.setProgress(0.0, animated: false)
            }
        }
    }

}