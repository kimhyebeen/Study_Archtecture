//
//  ViewController.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    var searchTextField: UITextField = UITextField()
    var searchButton: UIButton = UIButton()
    var tableView: UITableView = UITableView()
    
    var searchVM = SearchViewModel()
    var items: [DictionaryModel] {
        get {
            return searchVM.dictionaryItems.value ?? []
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
        
        searchVM.dictionaryItems.bind { [weak self] model in
            self?.tableView.reloadData()
        }
    }

    private func setupView() {
        self.view.addSubview(self.searchTextField)
        self.view.addSubview(searchButton)
        self.view.addSubview(tableView)
        
        setupSearchTextField()
        setupSearchButton()
        setupTableView()
    }
}
