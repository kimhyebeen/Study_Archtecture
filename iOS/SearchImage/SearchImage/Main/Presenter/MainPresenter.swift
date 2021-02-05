//
//  File.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

class MainPresenter: MainViewToPresenterProtocol {
    var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
    
    func requestSearchImages(word: String) {
        interactor?.fetchImageData(word: word)
    }
    
    func showDetailImageScreen(navigationController: UINavigationController) {
        router?.pushToDetailImageScreen(navigationConroller: navigationController)
    }
    
}

extension MainPresenter: MainInteractorToPresenterProtocol {
    func imageFetchedSuccess(items: [ImageEntity]) {
        view?.showImages(items: items)
    }
    
    func imageFetchFailed() {
        view?.showError()
    }
    
}
