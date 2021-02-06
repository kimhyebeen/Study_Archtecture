//
//  DetailProtocol.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

protocol DetailViewProtocol: class {
    var imageLink: String? { get set }
    func loadImage()
    func showError()
}

protocol DetailRouterProtocol: class {
    static func createModule(link: String) -> DetailViewController
}
