//
//  ContractView.swift
//  GameNews
//
//  Created by Hiroyuki Yahagi on 2016/09/04.
//  Copyright © 2016年 Hiroyuki Yahagi. All rights reserved.
//

import UIKit

class ContractViewController: UIViewController {

    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: ColorPallete.getMainColor()]
        self.closeButton.tintColor = ColorPallete.getMainColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
