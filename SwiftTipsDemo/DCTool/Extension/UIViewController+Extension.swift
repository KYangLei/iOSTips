//
//  UIViewController+Extension.swift
//  SwiftTipsDemo
//
//  Created by Dariel on 2018/10/15.
//  Copyright © 2018年 Dariel. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func dch_checkDeallocation(afterDelay delay: TimeInterval = 2.0) {
        let rootParentViewController = dch_rootParentViewController
        
        if isMovingFromParent || rootParentViewController.isBeingDismissed {
            let disappearanceSource: String = isMovingFromParent ? "removed from its parent" : "dismissed"
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { [weak self] in
                if let VC = self {
                    assert(self == nil, "\(VC.description) not deallocated after being \(disappearanceSource)")
                }
            })
        }
    }
    
    private var dch_rootParentViewController: UIViewController {
        var root = self
        while let parent = root.parent {
            root = parent
        }
        return root
    }
}
