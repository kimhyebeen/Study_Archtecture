//
//  DetailRouter.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/07.
//

import Foundation

class DetailRouter: DetailRouterProtocol {
    static func createModule(link: String) -> DetailViewController {
        let view = DetailViewController()
        view.imageLink = link
        
        return view
    }
}
