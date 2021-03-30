//
//  ViewController.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {
    var searchTotalCount: UILabel = UILabel()
    var searchTextField: UITextField = UITextField()
    var searchButton: UIButton = UIButton()
    var tableView: UITableView = UITableView()
    
    var searchVM = SearchViewModel()
    var items: [DictionaryModel] = []
    var totalCount: Int = 0 {
        willSet {
            searchTotalCount.text = "\(newValue)개 검색됨."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        binding()
    }

    private func setupView() {
        setupSearchButton()
        setupSearchTextField()
        setupSearchTotalCountLabel()
        setupTableView()
    }
    
    private func binding() {
        searchVM.dictionaryItems.bind { [weak self] model in
            self?.items = model
            self?.tableView.reloadData()
            self?.totalCount = model.count
        }
    }
    
    @objc func clickSearchButton(_ sender: UIButton) {
        self.searchVM.requestSearch(word: self.searchTextField.text)
    }
}
