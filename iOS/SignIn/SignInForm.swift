//
//  SignInForm.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit

class SignInForm: UIView {
    private let emailLabel = UILabel()
    let emailTextField = UITextField()
    private let emailDivider = UIView()
    private let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    private let passwordDivider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setFocusDesignEmailTextField(isFocus: Bool) {
        if isFocus {
            emailLabel.textColor = UIColor(named: "ButtonColor")
            emailDivider.backgroundColor = UIColor(named: "ButtonColor")
        } else {
            emailLabel.textColor = .systemGray
            emailDivider.backgroundColor = .systemGray
        }
    }
    
    func setFocusDesignPasswordTextField(isFocus: Bool) {
        if isFocus {
            passwordLabel.textColor = UIColor(named: "ButtonColor")
            passwordDivider.backgroundColor = UIColor(named: "ButtonColor")
        } else {
            passwordLabel.textColor = .systemGray
            passwordDivider.backgroundColor = .systemGray
        }
    }

}

extension SignInForm {
    func setupView() {
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
    }
    
    func setupEmailLabel() {
        emailLabel.text = "이메일"
        emailLabel.textColor = .systemGray
        self.addSubview(emailLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    func setupEmailTextField() {
        emailTextField.textColor = .darkGray
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        emailDivider.backgroundColor = .systemGray
        self.addSubview(emailDivider)
        
        emailDivider.translatesAutoresizingMaskIntoConstraints = false
        emailDivider.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4).isActive = true
        emailDivider.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        emailDivider.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        emailDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.text = "비밀번호"
        passwordLabel.textColor = .systemGray
        self.addSubview(passwordLabel)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.textColor = .darkGray
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        passwordDivider.backgroundColor = .systemGray
        self.addSubview(passwordDivider)
        
        passwordDivider.translatesAutoresizingMaskIntoConstraints = false
        passwordDivider.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4).isActive = true
        passwordDivider.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordDivider.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
