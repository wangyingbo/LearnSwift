//
//  ViewController.swift
//  06-MyLocation
//
//  Created by 王迎博 on 16/8/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var locationLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //初始化UI控件
        self.setupUI(testStr: "王颖博")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
    /**
     *  初始化UI控件
     */
    private func setupUI(testStr str: String) -> Void
    {
        //背部的图片
        let bgImageView: UIImageView = UIImageView.init(image: UIImage.init(named: "bg"))
        bgImageView.frame = self.view.bounds
        self.view.addSubview(bgImageView)
        
        //毛玻璃
        let blurEffect: UIBlurEffect = UIBlurEffect.init(style: .Dark)
        let blurView: UIVisualEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)

        //显示位置的底部view
        let locationViewW:CGFloat = UIScreen.mainScreen().bounds.size.width - 50
        let locationViewH:CGFloat = 80
        let locationView: UIView = UIView.init(frame: CGRectMake(self.view.frame.size.width/2-locationViewW/2, 80, locationViewW, locationViewH))
        locationView.backgroundColor = UIColor.grayColor()
        locationView.alpha = 0.5
        self.view.addSubview(locationView)
        
        //显示位置的label
        locationLabel = UILabel.init(frame: locationView.frame)
        locationLabel.text = "My Location"
        locationLabel.textAlignment = NSTextAlignment.Center
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.font = UIFont.systemFontOfSize(20.0)
        self.view.addSubview(locationLabel)
        
        //查找位置的底部view
        let findLocationViewW: CGFloat = UIScreen.mainScreen().bounds.size.width - 100
        let findLocationViewH: CGFloat = 60
        let findLocationImageView: UIImageView = UIImageView.init(frame: CGRectMake(self.view.frame.size.width/2-findLocationViewW/2, self.view.frame.size.height - 100, findLocationViewW, findLocationViewH))
        findLocationImageView.image = UIImage.init(named: "Find my location")
        self.view.addSubview(findLocationImageView)
        
        //查找位置的按钮button
        let findLocationButton: UIButton = UIButton.init(type: UIButtonType.Custom)
        findLocationButton.frame = findLocationImageView.frame
        findLocationButton.setTitle("Find Location", forState: UIControlState.Normal)
        findLocationButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        findLocationButton.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        let selector: Selector = #selector(ViewController.findLocationClick)
        findLocationButton.addTarget(self, action:selector, forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(findLocationButton)
        
    }
    
    /**
     点击查找位置，button的点击方法
     */
    func findLocationClick(send: AnyObject) -> Void
    {
        YBLog("________")
        
        //若要想访问定位服务，需要在info.plist文件里添加两个属性：NSLocationAlwaysUsageDescription和NSLocationWhenInUseUsageDescription
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    /**
     CLLocationManagerDelegate代理方法-加载位置失败
     */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        self.locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    /**
     CLLocationManagerDelegate代理方法-更新位置
     */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            
            if error != nil {
                self.locationLabel.text = "Reverse geocoder failed with error" + (error?.localizedDescription)!
                return
            }
            
            if placemarks!.count > 0
            {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            }
            else
            {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
            
        }
    }
    
    /**
     展示地名
     */
    func displayLocationInfo(placemark: CLPlacemark?) -> Void
    {
        if let containsPlacemark = placemark {
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            locationLabel.text = locality! +  postalCode! +  administrativeArea! +  country!
        }
        
    }
}

