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
    var imageCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    
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
        setupFlowLayout()
        setupImageCollectionView()
    }

}
