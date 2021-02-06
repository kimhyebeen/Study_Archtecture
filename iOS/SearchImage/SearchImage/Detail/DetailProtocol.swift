//
//  DetailProtocol.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

protocol DetailViewToPresenterProtocol: class {
    var view: DetailViewProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    var imageLink: String? { get set }
}

protocol DetailViewProtocol: class {
    var presentor: DetailViewToPresenterProtocol? { get set }
    func showImages(link: String)
    func showError()
}

protocol DetailRouterProtocol: class {
    static func createModule() -> MainViewController
}
