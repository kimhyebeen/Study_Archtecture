//
//  MainVC.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/17.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}


class MainVC: UIViewController {
    var email: String = "My User"
    let gradientView = UIView()
    let goodMorningLabel = UILabel()
    let mainLabel = UILabel()
    let logoutButton = UIButton()
    let balanceTableView = UITableView()
    let cardView = MainCardView()
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainVC - access token : \(String(describing: loginInstance?.accessToken))")
        
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupGradientView()
        setupGoodMorningLabel()
        setupMainLabel()
        setupLogoutButton()
        setupCardView()
    }
    
    @objc func clickLogoutButton(_ sender: UIButton) {
        DispatchQueue.global().async {
            self.loginInstance?.requestDeleteToken()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAPIInformation() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }

        if !isValidAccessToken {
            return
        }

        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }

        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!

        let authorization = "\(tokenType) \(accessToken)"
        print("token type : \(tokenType)")
        print("access token : \(accessToken)")

        let requestLogin = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])

        requestLogin.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else {return}

            print("MainVC - \(accessToken)")
            print("MainVC - \(name)")
            print("MainVC - \(email)")
            print("MainVC - \(id)")
        }
    }

}

// MARK: +Delegate
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: BalanceTableCell.identifier, for: indexPath) as! BalanceTableCell
        
        return cell
    }
}

// MARK: +UI
extension MainVC {
    func setupGradientView() {
        gradientView.clipsToBounds = false
        self.view.addSubview(gradientView)
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top * -1).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        gradientView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.4)
        gradientView.setGradient(color1: UIColor(named: "MountainColor") ?? .systemPink, color2: .white)
    }
    
    func setupGoodMorningLabel() {
        goodMorningLabel.text = "Good Morning, \(email)!"
        goodMorningLabel.font = UIFont.systemFont(ofSize: 12)
        goodMorningLabel.textColor = UIColor(named: "DarkMountainColor")
        self.view.addSubview(goodMorningLabel)
        
        goodMorningLabel.translatesAutoresizingMaskIntoConstraints = false
        goodMorningLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        goodMorningLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupMainLabel() {
        mainLabel.text = "Going to Los Angeles?"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mainLabel.textColor = UIColor(named: "DarkMountainColor")
        self.view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: goodMorningLabel.bottomAnchor, constant: 4).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupLogoutButton() {        
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.setTitleColor(.systemPink, for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        logoutButton.contentEdgeInsets.left = 20
        logoutButton.contentEdgeInsets.right = 20
        logoutButton.backgroundColor = .white
        logoutButton.layer.cornerRadius = 10
        logoutButton.layer.shadowOpacity = 0.3
        logoutButton.layer.shadowRadius = 4
        logoutButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        logoutButton.layer.shadowColor = UIColor.black.cgColor
        logoutButton.addTarget(self, action: #selector(clickLogoutButton(_:)), for: .touchUpInside)
        self.view.addSubview(logoutButton)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 30).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupBalanceTableView() {
        balanceTableView.delegate = self
        balanceTableView.dataSource = self
        cardView.addSubview(balanceTableView)
        
        balanceTableView.translatesAutoresizingMaskIntoConstraints = false
        balanceTableView.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        balanceTableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        balanceTableView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        balanceTableView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
    }
    
    func setupCardView() {
        cardView.setShadowOpacity(0.4)
        self.view.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 30).isActive = true
        cardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        cardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
