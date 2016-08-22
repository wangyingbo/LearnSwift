//
//  ViewController.swift
//  testScrollView04
//
//  Created by 王迎博 on 16/8/22.
//  Copyright © 2016年 王迎博. All rights reserved.

//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        let left: leftView = leftView(nibName: "leftView", bundle: nil)
        let camera: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let right: RightView = RightView(nibName: "RightView", bundle: nil)
        
        self.addChildViewController(left)
        self.scrollView.addSubview(left.view)
        left.didMoveToParentViewController(self)
        
        self.addChildViewController(right)
        self.scrollView.addSubview(right.view)
        right.didMoveToParentViewController(self)
        
        self.addChildViewController(camera)
        self.scrollView.addSubview(camera.view)
        camera.didMoveToParentViewController(self)
        
        var centerViewFrame: CGRect = camera.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        camera.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = right.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        right.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, 0)
        self.scrollView.pagingEnabled = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

