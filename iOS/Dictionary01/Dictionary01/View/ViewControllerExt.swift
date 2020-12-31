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
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = SearchTableCell()
        emptyCell.titleLabel.text = "(정보 없음)"
        
        guard let cell: SearchTableCell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier, for: indexPath) as? SearchTableCell else {
            
            return emptyCell
        }
        let item = self.items[indexPath.row]
        cell.setupViewInformation(title: item.title, contents: item.description)
        
        return cell
    }
}
