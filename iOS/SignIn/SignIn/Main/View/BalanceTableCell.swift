//
//  BalanceTableCell.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/17.
//

import UIKit

class BalanceTableCell: UITableViewCell {
    static let identifier = "BalanceTableCell"
    let balanceLabel = UILabel()
    let usdLabel = UILabel()
    let priceLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("balance cell is selected")
        // Configure the view for the selected state
    }
    
    func setupView() {
        self.accessoryType = .disclosureIndicator
        
        setupBalanceLabel()
        setupPriceLabel()
        setupUSDLabel()
    }
    
    func setupBalanceLabel() {
        balanceLabel.text = "Balance"
        balanceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        balanceLabel.textColor = .black
        self.contentView.addSubview(balanceLabel)
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        balanceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8).isActive = true
        balanceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    func setupPriceLabel() {
        priceLabel.text = "150,000"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 19)
        priceLabel.textColor = .black
        self.contentView.addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = false
        priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    
    func setupUSDLabel() {
        usdLabel.text = "USD"
        usdLabel.font = UIFont.boldSystemFont(ofSize: 12)
        usdLabel.textColor = .systemGray
        self.contentView.addSubview(usdLabel)
        
        usdLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        usdLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 8).isActive = true
    }

}
