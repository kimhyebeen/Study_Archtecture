//
//  MainRouter.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import UIKit

class MainRouter: MainRouterProtocol {
    static func createModule() -> MainViewController {
        let view = MainViewController()
        
        let presenter: MainViewToPresenterProtocol & MainInteractorToPresenterProtocol = MainPresenter()
        let interactor: MainInteractorProtocol = MainInteractor()
        let router: MainRouterProtocol = MainRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToDetailImageScreen(navigationController: UINavigationController, link: String) {
        let detailModue = DetailRouter.createModule(link: link)
        navigationController.pushViewController(detailModue, animated: true)
    }
}
