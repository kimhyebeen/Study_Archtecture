//
//  ViewControllerExt.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count == 0 ? 0 : self.items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.items.count {
            return getSearchTableCell(indexPath: indexPath)
        }
        
        return getMoreInfoTableCell(indexPath: indexPath)
    }
    
    private func getSearchTableCell(indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = SearchTableCell()
        emptyCell.titleLabel.text = "(정보 없음)"
        
        guard let cell: SearchTableCell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier, for: indexPath) as? SearchTableCell else {
            return emptyCell
        }
        
        let item = self.items[indexPath.row]
        cell.setupViewInformation(title: item.title, contents: item.description)
        
        return cell
    }
    
    private func getMoreInfoTableCell(indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = SearchTableCell()
        emptyCell.titleLabel.text = "(정보 없음)"
        
        guard let cell: MoreInfoTableCell = tableView.dequeueReusableCell(withIdentifier: MoreInfoTableCell.identifier, for: indexPath) as? MoreInfoTableCell else {
            return emptyCell
        }
        cell.frame.size = CGSize(width: self.view.frame.width - 60, height: 120)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.items.count {
            self.searchVM.requestSearch(word: self.searchTextField.text)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
