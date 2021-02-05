//
//  MainInteractor.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import CoreData
import Alamofire

class MainInteractor: MainInteractorProtocol {
    var presenter: MainInteractorToPresenterProtocol?
    
    func fetchImageData(word: String) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext! = appDelegate.persistentContainer.viewContext
        
        do {
            let data = try context.fetch(ImageData.fetchRequest()) as! [ImageData]
            
            if data.count == 0 {
                print("네트워크로 요청합니다.")
                self.requestSearchImages(word: word)
                return
            }
            
            let images: [ImageEntity] = data.map { ImageEntity(link: $0.link ?? "", thumbnail: $0.thumbnail ?? "") }
            print("데이터베이스에서 가져옵니다.")
            self.presenter?.imageFetchedSuccess(items: images)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func requestSearchImages(word: String) {
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
            
            let images: [ImageEntity] = items.map { ImageEntity(link: $0.link, thumbnail: $0.thumbnail) }
            self.presenter?.imageFetchedSuccess(items: images)
            for img in images {
                self.saveImageData(word: word, item: img)
            }
        }
    }
    
    private func saveImageData(word: String, item: ImageEntity) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext! = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ImageData", in: context)
        
        if let entity = entity {
            let data = NSManagedObject(entity: entity, insertInto: context)
            data.setValue(word, forKey: "word")
            data.setValue(item.link, forKey: "link")
            data.setValue(item.thumbnail, forKey: "thumbnail")
            
            do {
                try context.save()
            } catch {
                print("MainInteractor-saveImageData error: \(error.localizedDescription)")
            }
        }
    }
}
