//
//  HomeVC.swift
//  SwiftTabView
//
//  Created by 王迎博 on 16/10/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArr:[HomeModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGrayColor()
        self.dataArr = [HomeModel]()
        
        for var i = 0;i<=50;i += 1
        {
            let car:HomeModel = HomeModel()
            car.money = Int(arc4random()%100)+1
            let idStr:String = "1000000\(i)"
            car.Id = Int(idStr)
            
            if i%2 == 0 {
                car.name = "宝马"
            }else {
                car.name = "奔驰"
            }
            car.name = "我的car\(i)"
            
            self.dataArr.append(car)
        }
        
        createTableView()
    }
    
    func createTableView() -> Void {
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = true
        tableView.registerClass(HomeCell.self, forCellReuseIdentifier: "home_cell")
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("home_cell", forIndexPath: indexPath) as! HomeCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let carModel = dataArr[indexPath.row]
        cell.setCell(model:carModel)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let nextVC = NextVC()
        let carModel = dataArr[indexPath.row]
        nextVC.titleID = "cell-\(carModel.Id)"
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "HomeVC"
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
