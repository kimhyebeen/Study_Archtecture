//
//  ViewControllerComponents.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import UIKit

extension ViewController {
    // MARK: SearchButton
    func setupSearchButton() {
        self.searchButton.setTitle("검색", for: .normal)
        self.searchButton.setTitleColor(UIColor.systemBlue, for: .normal)
        self.searchButton.addTarget(self, action: #selector(clickSearchButton(_:)), for: .touchUpInside)
        self.view.addSubview(searchButton)
        
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.searchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.searchButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.searchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -35).isActive = true
    }
    
    // MARK: SearchTextField
    func setupSearchTextField() {
        self.searchTextField.placeholder = "검색어를 입력해주세요"
        self.searchTextField.borderStyle = .roundedRect
        self.view.addSubview(searchTextField)
        
        self.searchTextField.translatesAutoresizingMaskIntoConstraints = false
        self.searchTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.searchTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        self.searchTextField.trailingAnchor.constraint(equalTo: self.searchButton.leadingAnchor, constant: -20).isActive = true
    }
    
    // MARK: SearchTotalCountLabel
    func setupSearchTotalCountLabel() {
        self.searchTotalCount.text = "0개 검색됨"
        self.searchTotalCount.font = UIFont.systemFont(ofSize: 14)
        self.searchTotalCount.textColor = UIColor.systemOrange
        self.view.addSubview(searchTotalCount)
        
        self.searchTotalCount.translatesAutoresizingMaskIntoConstraints = false
        self.searchTotalCount.topAnchor.constraint(equalTo: self.searchTextField.bottomAnchor, constant: 8).isActive = true
        self.searchTotalCount.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35).isActive = true
    }
    
    // MARK: TableView
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
        self.tableView.register(MoreInfoTableCell.self, forCellReuseIdentifier: MoreInfoTableCell.identifier)
        self.view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.searchTextField.bottomAnchor, constant: 30).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
