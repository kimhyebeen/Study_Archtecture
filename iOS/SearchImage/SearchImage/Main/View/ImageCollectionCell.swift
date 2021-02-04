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
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
