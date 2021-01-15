//
//  ViewController.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/15.
//

import UIKit

class SignInVC: UIViewController {
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
