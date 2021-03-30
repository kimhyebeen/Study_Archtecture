//
//  ImageCollectionCell.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    static let identifier = "ImageCollectionCell"
    let imageView = UIImageView()
        .then {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "emptyImage")!
            $0.clipsToBounds = true
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setImage(link: String) {
        DispatchQueue.global().async {
            guard let url: URL = URL(string: link) else {
                self.setupEmptyImage()
                return
            }
            guard let imageData: Data = try? Data(contentsOf: url) else {
                self.setupEmptyImage()
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    private func setupEmptyImage() {
        DispatchQueue.main.async { [weak self] in
            self?.imageView.image = UIImage(named: "emptyImage")
        }
    }
}
