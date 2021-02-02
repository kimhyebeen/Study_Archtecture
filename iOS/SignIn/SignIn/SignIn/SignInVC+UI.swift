//
//  ViewControllerExtension.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit

extension SignInVC {
    enum ConstantSize: CGFloat {
        case leadingFromScrollView = 30
    }
    
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(image: UIImage(named: "mountains"))
        self.view.addSubview(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top * -1).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.frame.height * 0.5 * -1).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setupSignInRoundedRectangle() {
        roundedRectangle.naverSignInButton.addTarget(self, action: #selector(clickNaverSignInButton(_:)), for: .touchUpInside)
        roundedRectangle.signUpButton.addTarget(self, action: #selector(moveToSignUp(_:)), for: .touchUpInside)
        self.view.addSubview(roundedRectangle)
        
        roundedRectangle.translatesAutoresizingMaskIntoConstraints = false
        roundedRectangle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.35).isActive = true
        roundedRectangle.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.safeAreaInsets.bottom * -1).isActive = true
        roundedRectangle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        roundedRectangle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setupTabGesture() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
}
