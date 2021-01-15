//
//  SignInRoundedRectangle.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit

class SignInRoundedRectangle: UIView {
    let scrollView = UIScrollView()
    let titleLabel = UILabel()
    let signInForm = SignInForm()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    
    enum ConstantSize: CGFloat {
        case leadingFromScrollView = 30
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 30
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 30
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: -4)
        self.backgroundColor = .white
        
        setupScrollView()
        setupTitleLabel()
        setupSignInForm()
        setupSignInButton()
        setupSignUpButton()
    }
    
    func setupScrollView() {
        self.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.text = "로그인"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textColor = .darkGray
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
    }
    
    func setupSignInForm() {
        self.addSubview(signInForm)
        
        signInForm.translatesAutoresizingMaskIntoConstraints = false
        signInForm.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        signInForm.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
        signInForm.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue * -1).isActive = true
    }
    
    func setupSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.cornerRadius = 22.5
        signInButton.backgroundColor = UIColor(named: "ButtonColor")
        self.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: signInForm.bottomAnchor, constant: 100).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue * -1).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupSignUpButton() {
        let label = UILabel()
        label.text = "아직 회원이 아니신가요?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(signUpButton)

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -8).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signUpButton.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor, constant: -50).isActive = true
    }
    
}
