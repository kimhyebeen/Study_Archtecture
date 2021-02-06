//
//  MainProtocol.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

protocol MainViewToPresenterProtocol: class {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    func requestSearchImages(word: String)
    func showDetailImageScreen(navigationController: UINavigationController, link: String)
}

protocol MainViewProtocol: class {
    var presentor: MainViewToPresenterProtocol? { get set }
    func showImages(items: [ImageEntity])
    func showError()
}

protocol MainRouterProtocol: class {
    static func createModule() -> MainViewController
    func pushToDetailImageScreen(navigationController: UINavigationController, link: String)
}

protocol MainInteractorProtocol: class {
    var presenter: MainInteractorToPresenterProtocol? { get set }
    func fetchImageData(word: String)
}

protocol MainInteractorToPresenterProtocol: class {
    func imageFetchedSuccess(items: [ImageEntity])
    func imageFetchFailed()
}
