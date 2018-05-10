//
//  RoundedButton.swift
//  PineappleOrNah
//
//  Created by Kasey Schlaudt on 4/24/18.
//  Copyright © 2018 Kasey Schlaudt. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.height / 2
        
        self.layer.shadowRadius = 2.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
}
