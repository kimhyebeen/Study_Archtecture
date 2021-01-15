//
//  ViewController.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit
import RxSwift

class SignInVC: UIViewController {
    let roundedRectangle = SignInRoundedRectangle()
    let vm = SignInViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        bindViewModel()
        setupSignUpButton()
    }
    
    func bindViewModel() {
        roundedRectangle.signInForm.emailTextField.rx.text.orEmpty
            .bind(to: vm.input.email)
            .disposed(by: disposeBag)
        
        roundedRectangle.signInForm.passwordTextField.rx.text.orEmpty
            .bind(to: vm.input.password)
            .disposed(by: disposeBag)
        
        roundedRectangle.signInButton.rx.tap
            .bind(to: vm.input.signInButton)
            .disposed(by: disposeBag)
        
        vm.output.enableSignInButton.subscribe(onNext: { [weak self] enable in
            self?.roundedRectangle.setSignInButtonEnable(isEnable: enable)
        }).disposed(by: disposeBag)
        
        vm.output.enableLogIn.subscribe(onNext: { [weak self] login in
            if login { self?.moveToMain() }
        }).disposed(by: disposeBag)
    }
    
    func setupSignUpButton() {
        roundedRectangle.signUpButton.addTarget(self, action: #selector(moveToSignUp(_:)), for: .touchUpInside)
    }
    
    func moveToMain() {
        print("로그인되었습니다.")
    }
    
    @objc func moveToSignUp(_ sender: UIButton) {
        print("회원 가입으로 이동합니다.")
//        self.dismiss(animated: true, completion: nil)
    }

}
