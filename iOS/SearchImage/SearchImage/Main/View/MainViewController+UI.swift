//
//  MainViewController+UI.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

extension MainViewController {
    // Mark: Search Bar
    func setupSearchBar() {
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // Mark: Image Collection View
    func setupImageCollectionView() {
        setupImageCollectionViewSetting()
        self.view.addSubview(imageCollectionView)
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12).isActive = true
        imageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    private func setupImageCollectionViewSetting() {
        imageCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
            .then {
                $0.register(ImageCollectionCell.self, forCellWithReuseIdentifier: ImageCollectionCell.identifier)
                $0.backgroundColor = .clear
                $0.delegate = self
                $0.dataSource = self
            }
    }
}
