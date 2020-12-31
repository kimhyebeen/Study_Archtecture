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
    var items: [DictionaryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
        
        searchVM.dictionaryItems.bind { [weak self] model in
            self?.items = model ?? []
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

// 미리보기
//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentabletable: UIViewControllerRepresentable {
//    // update
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//
//    // make UI
//    @available(iOS 13.0, *)
//    func makeUIViewController(context: Context) -> some UIViewController {
//        ViewController()
//    }
//}
//
//struct ViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewControllerRepresentabletable()
//    }
//}
//#endif

