//
//  MainProtocol.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

protocol MainViewToPresenterProtocol: class{
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    func startRequestImages(word: String)
    func showMovieController(navigationController: UINavigationController)
}

protocol MainViewProtocol: class{
    func showImages(items: [ImageEntity])
    func showError()
}

protocol MainRouterProtocol: class {
    static func createModule() -> MainViewController
    func pushToDetailImageScreen(navigationConroller: UINavigationController)
}

protocol MainInteractorProtocol: class {
    var presenter: MainInteractorToPresenterProtocol? { get set }
    func requestSearchedImages()
}

protocol MainInteractorToPresenterProtocol: class {
    func imageFetchedSuccess(items: [ImageEntity])
    func imageFetchFailed()
}
