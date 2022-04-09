//
//  UIView+Extension.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/09.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return cornerRadius }
        set{
            //setting되는 값을 코너레디우스로 적용시킨다는 set
            self.layer.cornerRadius = newValue
        }
    }
}
