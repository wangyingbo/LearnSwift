//
//  otherVC.swift
//  testDelegate
//
//  Created by 王迎博 on 16/8/18.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit


protocol sendMessageDelegate {
    func sendMess(message: String) -> Void
}

class otherVC: UIViewController {
    
    @IBOutlet weak var sendLastTF: UITextField!
    @IBOutlet weak var sendLastBtn: UIButton!
    @IBOutlet weak var receiveLastTF: UITextField!
    
    @IBAction func sendLastClick(sender: AnyObject) {
        if delegate != nil {
            self.delegate?.sendMess(sendLastTF.text!)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    var tempStr: String?
    var delegate: sendMessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.receiveLastTF.text = self.tempStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
