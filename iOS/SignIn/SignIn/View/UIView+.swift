//
//  UIView+.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/03/30.
//

import UIKit

extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
