//
//  MainVC.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/17.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

class MainViewController: UIViewController {
    var email: String = "My User"
    let gradientView = UIView()
    let goodMorningLabel = UILabel()
    let mainLabel = UILabel()
    let logoutButton = UIButton()
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        mainLabel.text = "\(email)님\n로그인 성공"
        getAPIInformation()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupGradientView()
        setupGoodMorningLabel()
        setupMainLabel()
        setupLogoutButton()
    }
    
    @objc func clickLogoutButton(_ sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.loginInstance?.requestDeleteToken()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAPIInformation() {
        guard let tokenType = loginInstance?.tokenType, let accessToken = loginInstance?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        let authorization = "\(tokenType) \(accessToken)"
        let requestLogin = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        requestLogin.responseJSON { [weak self] response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let _ = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let _ = object["id"] as? String else {return}
            
            self?.mainLabel.text = "\(email)님\n로그인 성공"
        }
    }

}
