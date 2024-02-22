//
//  FilterModel.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

struct FilterModel {
    let filterTags: [FilterTag]
    let title: String
    
    init(filterTags: [FilterTag],
         title: String) {
        self.filterTags = filterTags
        self.title = title
    }
}
