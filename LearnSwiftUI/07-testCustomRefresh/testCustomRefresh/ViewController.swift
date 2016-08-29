//
//  ViewController.swift
//  testCustomRefresh
//
//  Created by 王迎博 on 16/8/29.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifer = "NewCellIdentifer"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var imojiData = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0,y: 0,width: UIScreen.mainScreen().bounds.size.width, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        emojiTableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), forControlEvents: .ValueChanged)
        self.refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "上次更新：\(NSDate())",attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        
        self.title = "emoij"
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imojiData.count
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath)
        
        //let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        cell.textLabel?.text = self.imojiData[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.systemFontOfSize(40)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }

    
    func didRoadEmoji() {
        self.imojiData = newFavoriteEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

