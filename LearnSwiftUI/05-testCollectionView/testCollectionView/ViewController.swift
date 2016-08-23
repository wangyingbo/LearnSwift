//
//  ViewController.swift
//  testCollectionView
//
//  Created by 王迎博 on 16/8/23.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    private var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    private struct Storyboard {
        
        static let CellIdentifier = "InterestCellID"
        
    }
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! InterestCollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
        
    }
}





