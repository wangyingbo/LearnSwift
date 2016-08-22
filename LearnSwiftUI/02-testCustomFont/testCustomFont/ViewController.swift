//
//  ViewController.swift
//  testCustomFont
//
//  Created by 王迎博 on 16/8/16.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fontArr = [String]()
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeButton: UIButton!
    @IBAction func changeFontDidTouch(sender: AnyObject) {
        fontRowIndex += 1
        tableView.reloadData()
        let index = self.fontNames.count - 1
        changeButton.titleLabel?.font = UIFont(name: self.fontNames[index], size: 15)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                print(font)
                fontArr.append(font)
            }
        }
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        changeButton.layer.cornerRadius = 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        let text = "第\(indexPath.row)行  字体：\(fontArr[indexPath.row])"
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.grayColor()
        cell.textLabel?.font = UIFont(name: fontArr[fontRowIndex], size: 15)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontArr.count
    }

}

