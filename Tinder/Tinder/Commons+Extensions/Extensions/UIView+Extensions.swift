//
//  UIView+Extensions.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

extension UIView {
    static var identifier: String { String(describing: self) }
    static var nibFile: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}
