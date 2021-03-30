//
//  DictionaryResponse.swift
//  Dictionary01
//
//  Created by 김혜빈 on 2020/12/30.
//

import Foundation

struct DictionaryResponse: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [DictionaryModel]
}

struct DictionaryModel: Codable {
    let title: String
    let link: String
    let description: String
    let thumbnail: String
}
