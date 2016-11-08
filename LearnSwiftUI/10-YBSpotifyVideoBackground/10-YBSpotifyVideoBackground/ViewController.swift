//
//  ViewController.swift
//  10-YBSpotifyVideoBackground
//
//  Created by 王迎博 on 16/11/7.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoBackground()
        
        loginButton.layer.cornerRadius = 4
        signUpButton.layer.cornerRadius = 4

        test(para1: "para1", para2: "para2")
    }
    
    func test(para1 para:String,para2:String) -> Void {
        YBLog(para2)
    }

    func setupVideoBackground()
    {
        //直接把视频文件拖拽进去的话再bundle里时找不到文件的，只能在TARGETS->Build Phases->Copy Bundle Resources里手动添加才能找到文件路径
        
        let bundleDBPath:String? = NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")
        let url = NSURL.fileURLWithPath(bundleDBPath!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        //view.userInteractionEnabled = false
    }

    @IBAction func loginButtonClick(sender: AnyObject) {
        //print("结果为：\(contentURL)")
        YBLog("_____________")
    }
    
    @IBAction func signUpButtonClick(sender: AnyObject) {
        YBLog("点击了登录按钮")
    }
}

