//
//  SettingViewController.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/08/29.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit
import BSGridCollectionViewLayout
import MessageUI

class SettingViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let titles = ["友達にすすめる","おすすめアプリ","利用規約","レビューする","ブログ追加依頼","お問い合わせ"]
    let images = ["friends.png","apps.png","constract.png","reviews.png","blogs.png","inquery.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: ColorPallete.getMainColor()]
        self.stopButton.tintColor = ColorPallete.getMainColor()
        
        let layout = GridCollectionViewLayout()
        layout.itemsPerRow = 3
        layout.itemSpacing = 2
        layout.itemHeightRatio = 3/4
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.collectionViewLayout = layout
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func stopButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: Data source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            //友達に薦める
            let board = UIPasteboard.generalPasteboard()
            board.setValue(PropertiesLoader.getProperties("Self"), forPasteboardType: "public.text")
            let alert:UIAlertController = UIAlertController(title: "アプリのリンクを\nコピーしました。", message: "ペーストして友達に共有しよう！", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) -> Void in
            }))
            self.presentViewController(alert, animated: true, completion: {
            })
            break
        case 1:
            //おすすめアプリ
            break
        case 2:
            //利用規約
            let cvc = ContractViewController()
            self.presentViewController(cvc, animated: true, completion: nil)
            break
        case 3:
            //レビューする
            doReview()
            break
        case 4:
            //ブログ追加
            sendAddBlog()
            break
        case 5:
            //お問い合わせ
            sendInquery()
            break
        default:
            break
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let view:UIView = UINib(nibName: "SettingCell", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        view.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(view)
        
        cell.contentView.addConstraints([
            NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: cell.contentView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: cell.contentView,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: cell.contentView,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: cell.contentView,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: 0
            )
        ])
        
        for subView:UIView in cell.contentView.subviews[0].subviews {
            switch subView.tag {
            case 1:
                //imageview
                let imageView:UIImageView? = subView as? UIImageView
                imageView?.image = UIImage(named: images[indexPath.row])
                if(imageView?.image == nil){
                    imageView?.image = UIImage(named: "no_image.jpg")
                }
                break
            case 2:
                //label
                let label:UILabel? = subView as? UILabel
                label?.text = titles[indexPath.row]
                break
            default:
                break
            }
        }
        
        return cell
    }
    
    private func doReview(){
        let alert:UIAlertController = UIAlertController(title: "お礼", message: "レビューありがとうございます。AppleStoreへ遷移します。", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) -> Void in
            let itunesURL:String = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id="+(PropertiesLoader.getProperties("AppID") as! String)
            let url = NSURL(string:itunesURL)
            let app:UIApplication = UIApplication.sharedApplication()
            app.openURL(url!)
        }))
        self.presentViewController(alert, animated: true, completion: {
        })
        return
    }
    
    private func sendAddBlog(){
        //メールを送信できるかチェック
        if MFMailComposeViewController.canSendMail()==false {
            let alert:UIAlertController = UIAlertController(title: "エラー", message: "お使いのデバイスではメールを送信できません。", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alert, animated: true, completion: {
            })
            return
        }
        
        let mailViewController = MFMailComposeViewController()
        mailViewController.mailComposeDelegate = self
        let toRecipients = [(PropertiesLoader.getProperties("Inquiry.Mail") as! String )]
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("["+(PropertiesLoader.getProperties("Title.Text") as! String)+"]へのブログ追加")
        mailViewController.setToRecipients(toRecipients)
        mailViewController.setMessageBody("追加してほしいブログURLなどをご記載ください。", isHTML: false)
        self.presentViewController(mailViewController, animated: true, completion: nil)
    }
    
    
    private func sendInquery(){
        //メールを送信できるかチェック
        if MFMailComposeViewController.canSendMail()==false {
            let alert:UIAlertController = UIAlertController(title: "エラー", message: "お使いのデバイスではメールを送信できません。", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alert, animated: true, completion: {
            })
            return
        }
        
        let mailViewController = MFMailComposeViewController()
        mailViewController.mailComposeDelegate = self
        let toRecipients = [(PropertiesLoader.getProperties("Inquiry.Mail") as! String )]
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("["+(PropertiesLoader.getProperties("Title.Text") as! String)+"]に関する問い合わせ")
        mailViewController.setToRecipients(toRecipients)
        mailViewController.setMessageBody("お問い合わせ内容をご記載ください。", isHTML: false)
        self.presentViewController(mailViewController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            self.dismissViewControllerAnimated(true, completion: nil)
            break
        case MFMailComposeResultSaved.rawValue:
            self.dismissViewControllerAnimated(true, completion: nil)
            break
        case MFMailComposeResultSent.rawValue:
            self.dismissViewControllerAnimated(true, completion: nil)
            break
        case MFMailComposeResultFailed.rawValue:
            self.dismissViewControllerAnimated(true, completion: nil)
            break
        default:
            break
        }
    }
    
}