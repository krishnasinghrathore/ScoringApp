//
//  Designables.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class DesignableButton: UIView {
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue;
        }
    }
}
