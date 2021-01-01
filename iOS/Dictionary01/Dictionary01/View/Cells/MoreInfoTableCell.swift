//
//  MoreInfoTableCell.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2021/01/01.
//

import UIKit

class MoreInfoTableCell: UITableViewCell {
    static let identifier = "MoreInfoTableCell"
    private let moreInfoButton: UIButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        self.contentView.addSubview(self.moreInfoButton)
        
        self.moreInfoButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupMoreInfoButton()
    }
    
    private func setupMoreInfoButton() {
        self.moreInfoButton.setTitle("더보기", for: .normal)
        self.moreInfoButton.backgroundColor = UIColor.lightGray
        
        self.moreInfoButton.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.moreInfoButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.moreInfoButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.moreInfoButton.frame.size = CGSize(width: self.contentView.frame.width, height: 100)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}
