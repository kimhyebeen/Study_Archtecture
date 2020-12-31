//
//  SearchViewModel.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation

class SearchViewModel {
    var dictionaryItems: Observable<[DictionaryModel]?> = Observable(nil)
    
    func requestSearch(word: String?) {
        guard let searchWord: String = word, !(word?.isEmpty ?? true) else {
            return
        }
    }
    
    func setDictionaryItem(items: [DictionaryModel]) {
        self.dictionaryItems.value = items
    }
}
