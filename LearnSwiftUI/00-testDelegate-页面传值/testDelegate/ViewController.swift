//
//  ViewController.swift
//  testDelegate
//
//  Created by 王迎博 on 16/8/18.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendNextTF: UITextField!
    
    @IBOutlet weak var sendNextBtn: UIButton!
    
    @IBOutlet weak var receiveNextTF: UITextField!
    
    @IBAction func sendNextClick(sender: AnyObject) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let other = storyboard.instantiateViewControllerWithIdentifier("otherVCSB") as! otherVC
        other.delegate = self
        //other.receiveLastTF?.text = sendNextTF.text //这样写容易崩溃，原因还没找到
        other.tempStr = sendNextTF.text
        self.navigationController?.pushViewController(other, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


extension ViewController:sendMessageDelegate {
    func sendMess(message: String) {
        receiveNextTF.text = message
    }
}
