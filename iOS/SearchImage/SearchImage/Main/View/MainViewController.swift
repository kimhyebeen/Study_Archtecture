//
//  ViewController.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/03.
//

import UIKit
import Then

class MainViewController: UIViewController {
    let searchBar = UISearchBar()
        .then {
            $0.placeholder = "이미지를 검색해주세요."
            $0.setShowsCancelButton(true, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        self.view.backgroundColor = .white
        
        setupSearchBar()
    }

}
