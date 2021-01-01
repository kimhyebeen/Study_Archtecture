//
//  MoreInfoTableCell.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2021/01/01.
//

import UIKit

class MoreInfoTableCell: UITableViewCell {
    static let identifier = "MoreInfoTableCell"
    private let moreInfoLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        self.contentView.addSubview(self.moreInfoLabel)
        
        self.moreInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupMoreInfoLabel()
    }
    
    private func setupMoreInfoLabel() {
        self.moreInfoLabel.text = "더보기"
        self.moreInfoLabel.textColor = UIColor.systemBlue
        
        self.moreInfoLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.moreInfoLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}
