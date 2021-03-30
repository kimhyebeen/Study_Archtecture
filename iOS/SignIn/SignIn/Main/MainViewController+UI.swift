//
//  MainViewController+UI.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/03/30.
//

import UIKit

extension MainViewController {
    // MARK: GradientView
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
    
    // MARK: GoodMorningLabel
    func setupGoodMorningLabel() {
        goodMorningLabel.text = "Good Morning, \(email)!"
        goodMorningLabel.font = UIFont.systemFont(ofSize: 12)
        goodMorningLabel.textColor = UIColor(named: "DarkMountainColor")
        self.view.addSubview(goodMorningLabel)
        
        goodMorningLabel.translatesAutoresizingMaskIntoConstraints = false
        goodMorningLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        goodMorningLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // MARK: MainLabel
    func setupMainLabel() {
        mainLabel.text = "Going to Los Angeles?"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mainLabel.textColor = UIColor(named: "DarkMountainColor")
        self.view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: goodMorningLabel.bottomAnchor, constant: 4).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // MARK: LogoutButton
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
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
