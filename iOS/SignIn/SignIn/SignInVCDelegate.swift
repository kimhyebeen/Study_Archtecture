//
//  SignInVCDelegate.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit

extension SignInVC: UIGestureRecognizerDelegate, UITextFieldDelegate {
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
