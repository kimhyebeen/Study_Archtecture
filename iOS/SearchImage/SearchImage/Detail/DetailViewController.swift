//
//  DetailViewController.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol, UIScrollViewDelegate {
    var imageLink: String?
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupScrollView()
        setupImageView()
        loadImage()
    }
    
    func loadImage() {
        guard let link = imageLink else { return }
        
        DispatchQueue.global().async {
            guard let url: URL = URL(string: link) else {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(named: "emptyImage")
                }
                return
            }
            guard let imageData: Data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(named: "emptyImage")
                }
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    func showError() {
        print("DetailViewController - error 발생")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        self.view.backgroundColor = .black
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if scale == 1.0 {
            self.view.backgroundColor = .white
            self.navigationController?.isNavigationBarHidden = false
        }
    }

}

// MARK: +UI
extension DetailViewController {
    // MARK: Scroll View
    func setupScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentMode = .scaleAspectFit
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    // MARK: Image View
    func setupImageView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        imageView.contentMode = .scaleAspectFit
        scrollView.contentSize = imageView.frame.size
        scrollView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
}
