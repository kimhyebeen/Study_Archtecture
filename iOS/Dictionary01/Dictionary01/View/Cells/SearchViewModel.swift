//
//  SearchViewModel.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation
import Alamofire

class SearchViewModel {
    private let baseUrl = "https://openapi.naver.com/v1/search/encyc.json"
    private var nextStart: Int = 1
    private var preQuery: String = ""
    private var _dictionaryItems: Observable<[DictionaryModel]> = Observable([])
    var dictionaryItems: Observable<[DictionaryModel]> {
        get {
            return _dictionaryItems
        }
    }
    
    func requestSearch(word: String?) {
        if preQuery != word { self.nextStart = 1 }
        if self.nextStart > 991 { return }
        guard let searchWord: String = word, !(word?.isEmpty ?? true) else {
            return
        }
        
        AF.request(
            baseUrl,
            method: .get,
            parameters: ["query":searchWord, "start":nextStart],
            headers: ["X-Naver-Client-Id":"Z6OHzyRe_5anc4FWCoq2", "X-Naver-Client-Secret":"pSumWoEXFY"]
        ).responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.getDictionaryModel(value: value, word: searchWord)
                case .failure(let error):
                    print("SearchViewModel - requestSearch - error: \(error.localizedDescription)")
                }
            }
    }
    
    private func getDictionaryModel(value: Any, word: String){
        do {
            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
            let dictionaryResponse: DictionaryResponse = try JSONDecoder().decode(DictionaryResponse.self, from: data)
            
            if isSameWord(newWord: word) {
                self._dictionaryItems.value += dictionaryResponse.items
            } else {
                self._dictionaryItems.value = dictionaryResponse.items
            }
            
            self.preQuery = word
            self.nextStart = dictionaryResponse.start + 10
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func isSameWord(newWord: String) -> Bool {
        return self.preQuery == newWord
    }
}
