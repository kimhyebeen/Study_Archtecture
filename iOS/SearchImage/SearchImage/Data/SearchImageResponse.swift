//
//  SearchImageResponse.swift
//  SearchImage
//
//  Created by 김혜빈 on 2021/02/05.
//

import Foundation

struct SearchImageResponse: Codable {
    let total: Int
    let start: Int
    let display: Int
    let items: [SearchImage]
}

struct SearchImage: Codable {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight: String
    let sizewidth: String
    
    var width: Int {
        return Int(sizewidth) ?? 0
    }
    
    var height: Int {
        return Int(sizeheight) ?? 0
    }
}
