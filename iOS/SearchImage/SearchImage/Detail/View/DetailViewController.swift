//
//  DetailViewController.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

import UIKit

class DetailViewController: UIViewController {
    var scrollView: UIScrollView!
    var imageView = UIImageView()

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
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 3.0
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // MARK: Image View
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    }
}
