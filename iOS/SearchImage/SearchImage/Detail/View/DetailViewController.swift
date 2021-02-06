//
//  DetailViewController.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

import UIKit

class DetailViewController: UIViewController {
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        setupScrollView()
        setupImageView()
    }

}

// MARK: +UI
extension DetailViewController {
    // MARK: Scroll View
    func setupScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // MARK: Image View
    func setupImageView() {
        
    }
}
