//
//  BothCell.swift
//  CarModel
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class BothCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var iconView: UIImageView!
    
    
    @IBOutlet weak var favoL: UILabel!
    
    @IBOutlet weak var shareL: UILabel!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    
    @IBOutlet weak var carNameL: UILabel!
    
    @IBOutlet weak var className: UILabel!
    
    @IBOutlet weak var cityNameL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.iconView.layer.masksToBounds = true
        self.iconView.layer.cornerRadius = self.iconView.frame.height / 2
    }

    func customWith(model:CarModel) -> Void{
        self.imgView.sd_setImageWithURL(NSURL.init(string: model.cover!))
        self.iconView.sd_setImageWithURL(NSURL.init(string: model.avatar!))
        self.favoL.text = String(model.favor_num!)
        self.shareL.text = String(model.share_num!)
        self.titleL.text = model.title!
        self.carNameL.text = model.modi_car_name!
        self.className.text = model.modi_class_name!
        self.cityNameL.text = model.city_name!
    }
    
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
