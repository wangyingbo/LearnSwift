//
//  ViewController.swift
//  YBImageScrollerEffect
//
//  Created by 王迎博 on 16/11/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "steve"))
        
        setUpScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(size: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterImage()
    }

    
    override func viewWillLayoutSubviews() {
        setZoomScaleFor(size: scrollView.bounds.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    
    
    private func setUpScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    
    private func setZoomScaleFor (size scrollViewSize:CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width/imageSize.width
        let heightScale = scrollViewSize.height/imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    
    
    private func recenterImage () -> Void {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width<scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        let veticalSpace = imageViewSize.height<scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2 : 0
        scrollView.contentInset = UIEdgeInsetsMake(veticalSpace, horizontalSpace, veticalSpace, horizontalSpace)
    }
    
    
    func viewForZoomingInScrollView(scrollView:UIScrollView) -> UIView? {
        return self.imageView
    }

    
    func scrollViewDidZoom(scrollView:UIScrollView) -> Void {
        self.recenterImage()
    }
}

