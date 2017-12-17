//
//  BorderedButton.swift
//  Breakpoint
//
//  Created by Osama on 17/12/2017.
//  Copyright © 2017 Osama. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedButton: UIButton {

    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.borderColor = UIColor(red: 41, green: 43, blue: 52, alpha: 1.0).cgColor
        self.layer.borderWidth = 2.0
    }
}
