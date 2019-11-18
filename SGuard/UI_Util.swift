//
//  UI_Util.swift
//  SGuard
//
//  Created by Sang To on 11/17/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import Foundation
import UIKit

class UI_Util {

    static func setGradientGreenBlue(uiView: UIView) {

        let colorTop =  UIColor(red:0.04, green:0.06, blue:0.06, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.20, green:0.30, blue:0.30, alpha:1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = uiView.bounds

        uiView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
