//
//  VideoCell.swift
//  testLocalVideo
//
//  Created by 王迎博 on 16/8/18.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}


class VideoCell: UITableViewCell {

    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoSourceLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
