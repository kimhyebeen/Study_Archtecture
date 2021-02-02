//
//  MainCardView.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/17.
//

import UIKit

class MainCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.backgroundColor = .white
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func setShadowRadius(_ radius: CGFloat) {
        self.layer.shadowRadius = radius
    }
    
    func setShadowOpacity(_ opacity: Float) {
        self.layer.shadowOpacity = opacity
    }
    
}
