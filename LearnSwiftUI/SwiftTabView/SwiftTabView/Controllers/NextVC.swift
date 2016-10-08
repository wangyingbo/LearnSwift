//
//  NextVC.swift
//  SwiftTabView
//
//  Created by 王迎博 on 16/10/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class NextVC: UIViewController {

    var carName:String!
    var titleID:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleID
        
        self.view.backgroundColor=UIColor.lightGrayColor()
        
    }

}
