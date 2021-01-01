//
//  SearchViewModel.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation
import Alamofire

class SearchViewModel {
    let baseUrl = "https://openapi.naver.com/v1/search/encyc.json"
    var dictionaryItems: Observable<[DictionaryModel]?> = Observable(nil)
    
    func requestSearch(word: String?) {
        guard let searchWord: String = word, !(word?.isEmpty ?? true) else {
            return
        }
        
        AF.request(
            baseUrl,
            method: .get,
            parameters: ["query":searchWord],
            headers: ["X-Naver-Client-Id":"Z6OHzyRe_5anc4FWCoq2", "X-Naver-Client-Secret":"pSumWoEXFY"]
        ).responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.getDictionaryModel(value: value)
                case .failure(let error):
                    print("SearchViewModel - requestSearch - error: \(error.localizedDescription)")
                }
            }
    }
    
    func getDictionaryModel(value: Any){
        do {
            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
            let dictionaryResponse: DictionaryResponse = try JSONDecoder().decode(DictionaryResponse.self, from: data)
            self.dictionaryItems.value = dictionaryResponse.items
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setDictionaryItem(items: [DictionaryModel]) {
        self.dictionaryItems.value = items
    }
}
