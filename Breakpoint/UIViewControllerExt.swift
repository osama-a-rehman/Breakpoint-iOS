//
//  UIViewControllerExt.swift
//  Breakpoint
//
//  Created by Osama on 14/01/2018.
//  Copyright © 2018 Osama. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentDetail(viewControllerToPresent viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
