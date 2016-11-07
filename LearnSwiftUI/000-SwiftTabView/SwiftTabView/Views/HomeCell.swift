//
//  HomeCell.swift
//  SwiftTabView
//
//  Created by 王迎博 on 16/10/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    var headImageView:UIImageView!
    var nameLabel:UILabel!
    var IdLabel:UILabel!
    var moneyLabel:UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        /**第二种写法，复用子控件*/
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() -> Void {
        self.headImageView = UIImageView()
        self.headImageView.frame = CGRectMake(10, 10, 100, 100)
        self.contentView.addSubview(self.headImageView)
        
        self.nameLabel = UILabel(frame:CGRectMake(120,10,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.nameLabel)
        
        self.IdLabel=UILabel(frame: CGRectMake(120,40,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.IdLabel)
        
        self.moneyLabel = UILabel(frame: CGRectMake(120,70,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.moneyLabel)
    }
    
    func setCell(model model:HomeModel) -> Void {
        /** 第一种写法，不复用子控件
        for sub_view in self.contentView.subviews
        {
            sub_view.removeFromSuperview()
        }
        self.headImageView = UIImageView()
        self.headImageView.frame = CGRectMake(10, 10, 100, 100)
        self.contentView.addSubview(self.headImageView)
        
        self.nameLabel = UILabel(frame:CGRectMake(120,10,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.nameLabel)
        
        self.IdLabel=UILabel(frame: CGRectMake(120,40,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.IdLabel)
        
        self.moneyLabel = UILabel(frame: CGRectMake(120,70,self.contentView.frame.size.width - 100,30))
        self.contentView.addSubview(self.moneyLabel)
        */
        
        //设置数据
        self.headImageView.image = UIImage(named: "1.jpg")
        self.nameLabel.text = "名字:\(model.name)"
        self.IdLabel.text = "编号:\(model.Id)"
        self.moneyLabel.text = "价格:\(model.money)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
