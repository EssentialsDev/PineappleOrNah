//
//  RoundedLabel.swift
//  PineappleOrNah
//
//  Created by Kasey Schlaudt on 4/24/18.
//  Copyright © 2018 Kasey Schlaudt. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
