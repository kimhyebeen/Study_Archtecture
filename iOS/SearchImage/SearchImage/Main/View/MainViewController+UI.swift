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
        self.view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
