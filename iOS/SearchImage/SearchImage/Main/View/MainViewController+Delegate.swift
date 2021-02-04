//
//  MainViewController+Delegate.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

// MARK: Main View Protocol
extension MainViewController: MainViewProtocol {
    func showImages(items: [ImageEntity]) {
        images = items
        imageCollectionView.reloadData()
    }
    
    func showError() {
        print("MainViewController - error 발생")
    }
    
}

// MARK: Collection View
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ImageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.identifier, for: indexPath) as? ImageCollectionCell else {
            return ImageCollectionCell()
        }
        
        cell.setImage(link: images[indexPath.item].thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let nc = self.navigationController else {
            print("Main의 Navigation Controller가 존재하지 않습니다.")
            return true
        }
        
        presentor?.showDetailImageScreen(navigationController: nc)
        return true
    }
}

// MARK: Search Bar
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        presentor?.requestSearchImages(word: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
