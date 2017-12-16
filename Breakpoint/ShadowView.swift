//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Osama on 16/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        func setupView(){
            self.layer.shadowOpacity = 0.7
            self.layer.shadowRadius = 5
            self.layer.shadowColor = UIColor.black.cgColor
        }
        
        super.awakeFromNib()
    }
}
