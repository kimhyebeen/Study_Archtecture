//
//  MainInteractor.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import Alamofire

class MainInteractor: MainInteractorProtocol {
    var presenter: MainInteractorToPresenterProtocol?
    
    func requestSearchImages(word: String) {
        print("interactor - request search images")
        AF.request(
            "https://openapi.naver.com/v1/search/image",
            method: .get,
            parameters: ["query" : word, "display" : 60],
            encoding: URLEncoding.default,
            headers: ["X-Naver-Client-Id":SecretKeySet.naverClientId, "X-Naver-Client-Secret":SecretKeySet.naverClientSecret]
        )
        .validate(statusCode: 200..<300)
        .responseJSON { (json) in
            guard let data = json.data else { return }
            let response = try? JSONDecoder().decode(SearchImageResponse.self, from: data)
            guard let items = response?.items else {
                self.presenter?.imageFetchFailed()
                return
            }
            
            self.presenter?.imageFetchedSuccess(items:
                items.map { item in
                    ImageEntity(title: item.title, link: item.link, thumbnail: item.thumbnail)
                }
            )
        }
    }
}
