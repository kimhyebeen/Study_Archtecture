//
//  ViewController.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit
import RxSwift
import NaverThirdPartyLogin

class SignInVC: UIViewController {
    let roundedRectangle = SignInRoundedRectangle()
    let vm = SignInViewModel()
    let disposeBag = DisposeBag()
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginInstance?.delegate = self
        
        setupView()
        bindViewModel()
    }
    
    func setupView() {
        setupBackgroundImage()
        setupSignInRoundedRectangle()
        setupTabGesture()
        
        roundedRectangle.signInForm.emailTextField.delegate = self
        roundedRectangle.signInForm.passwordTextField.delegate = self
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
        
        vm.output.emailStatus.subscribe(onNext: { [weak self] status in
            self?.roundedRectangle.signInForm.setEmailFailrueLabel(isCorrect: status)
        }).disposed(by: disposeBag)
        
        vm.output.passwordStatus.subscribe(onNext: { [weak self] status in
            self?.roundedRectangle.signInForm.setPasswordFailureLabel(isCorrect: status)
        }).disposed(by: disposeBag)
    }
    
    @objc func clickNaverSignInButton(_ sender: UIButton) {
        loginInstance?.requestThirdPartyLogin()
    }
    
    func moveToMain() {
        let appWindow = UIApplication.shared.windows[0]
        self.view.window?.rootViewController?.dismiss(animated: true, completion: {
            let mainVC = MainVC()
            mainVC.modalPresentationStyle = .fullScreen
            appWindow.rootViewController?.show(mainVC, sender: nil)
        })
    }
    
    @objc func moveToSignUp(_ sender: UIButton) {
        print("회원 가입으로 이동합니다.")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? MainVC else {
            return
        }
        
        nextVC.email = roundedRectangle.signInForm.emailTextField.text ?? ""
    }
}
