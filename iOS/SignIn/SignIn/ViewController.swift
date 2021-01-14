//
//  ViewController.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let roundedRectangle = UIView()
    let scrollView = UIScrollView()
    let titleLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let pwLabel = UILabel()
    let pwTextField = UITextField()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    
    enum ConstantSize: CGFloat {
        case leadingFromScrollView = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        setupBackgroundImage()
        setupRoundedRectangle()
        setupScrollView()
        setupTitleLabel()
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupSignInButton()
        setupSignUpButton()
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
    
    func setupRoundedRectangle() {
        roundedRectangle.layer.cornerRadius = 30
        roundedRectangle.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        roundedRectangle.backgroundColor = .white
        roundedRectangle.layer.shadowColor = UIColor.black.cgColor
        roundedRectangle.layer.shadowRadius = 30
        roundedRectangle.layer.shadowOpacity = 1
        roundedRectangle.layer.shadowOffset = CGSize(width: 0, height: -4)
        self.view.addSubview(roundedRectangle)
        
        roundedRectangle.translatesAutoresizingMaskIntoConstraints = false
        roundedRectangle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.35).isActive = true
        roundedRectangle.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.safeAreaInsets.bottom * -1).isActive = true
        roundedRectangle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        roundedRectangle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setupScrollView() {
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: roundedRectangle.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: roundedRectangle.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: roundedRectangle.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: roundedRectangle.trailingAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.text = "로그인"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
    }
    
    func setupEmailLabel() {
        emailLabel.text = "이메일"
        emailLabel.textColor = .gray
        self.view.addSubview(emailLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
    }
    
    func setupEmailTextField() {
        emailTextField.placeholder = "이메일을 입력해주세요"
        self.view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue * -1).isActive = true
        
        let divider = UIView()
        divider.backgroundColor = .gray
        self.view.addSubview(divider)
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4).isActive = true
        divider.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordLabel() {
        pwLabel.text = "비밀번호"
        pwLabel.textColor = .gray
        self.view.addSubview(pwLabel)
        
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        pwLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
    }
    
    func setupPasswordTextField() {
        pwTextField.placeholder = "비밀번호를 입력해주세요"
        self.view.addSubview(pwTextField)
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: pwLabel.bottomAnchor, constant: 8).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue * -1).isActive = true
        
        let divider = UIView()
        divider.backgroundColor = .gray
        self.view.addSubview(divider)
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 4).isActive = true
        divider.leadingAnchor.constraint(equalTo: pwTextField.leadingAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: pwTextField.trailingAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.cornerRadius = 22.5
        signInButton.backgroundColor = UIColor(named: "ButtonColor")
        self.view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 100).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: ConstantSize.leadingFromScrollView.rawValue * -1).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupSignUpButton() {
        let label = UILabel()
        label.text = "아직 회원이 아니신가요?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(signUpButton)

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -8).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signUpButton.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor, constant: -50).isActive = true
    }

}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentabletable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    // make UI
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentabletable().previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
#endif
