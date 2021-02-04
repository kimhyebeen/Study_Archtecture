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
    var imageCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
        .then {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width-8)/3, height: (UIScreen.main.bounds.width-8)/3)
            $0.scrollDirection = .vertical
        }
    
    var images: [ImageEntity] = []
    var presentor: MainViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        self.title = "이미지 검색"
        self.view.backgroundColor = .white
        
        setupSearchBar()
        setupImageCollectionView()
    }

}
