//
//  ViewController.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let roundedRectangle = SignInRoundedRectangle()
    
    enum ConstantSize: CGFloat {
        case leadingFromScrollView = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }

}

extension ViewController {
    func setupView() {
        setupBackgroundImage()
        setupSignInRoundedRectangle()
        setupTabGesture()
        
        roundedRectangle.signInForm.emailTextField.delegate = self
        roundedRectangle.signInForm.passwordTextField.delegate = self
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

extension ViewController: UIGestureRecognizerDelegate, UITextFieldDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case roundedRectangle.signInForm.emailTextField:
            roundedRectangle.signInForm.setFocusDesignEmailTextField(isFocus: true)
        case roundedRectangle.signInForm.passwordTextField:
            roundedRectangle.signInForm.setFocusDesignPasswordTextField(isFocus: true)
        default:
            print("text field should begin editing - default")
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case roundedRectangle.signInForm.emailTextField:
            roundedRectangle.signInForm.setFocusDesignEmailTextField(isFocus: false)
        case roundedRectangle.signInForm.passwordTextField:
            roundedRectangle.signInForm.setFocusDesignPasswordTextField(isFocus: false)
        default:
            print("text field should end editing - default")
        }
        return true
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
