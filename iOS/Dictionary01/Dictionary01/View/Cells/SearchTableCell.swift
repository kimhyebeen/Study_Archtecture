//
//  SearchTableCell.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import UIKit

class SearchTableCell: UITableViewCell {
    static let identifier = "SearchTableCell"
    var titleLabel: UILabel = UILabel()
    var contentLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
    }
    
    private func setupCellView() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupTitleLabel()
        setupContentLabel()
    }

    private func setupTitleLabel() {
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
    }
    
    private func setupContentLabel() {
        self.contentLabel.numberOfLines = 0
        
        self.contentLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
        self.contentLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.contentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.contentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupViewInformation(title: String, contents: String) {
        self.titleLabel.text = title
        self.contentLabel.text = contents
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
