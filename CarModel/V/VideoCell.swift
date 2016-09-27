//
//  VideoCell.swift
//  CarModel
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    
    @IBOutlet weak var iconView: UIImageView!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    
    func customWith(model:CarModel) -> Void {
        self.iconView.sd_setImageWithURL(NSURL.init(string: model.cover!))
        self.titleL.text = model.title
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
