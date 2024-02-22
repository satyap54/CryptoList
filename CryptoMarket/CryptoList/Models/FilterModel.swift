//
//  FilterModel.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

struct FilterModel: Equatable {
    let filterTags: [FilterTag]
    let title: String
    let compositionOperation: FilterCompositionOperation
    
    init(filterTags: [FilterTag],
         title: String,
         compositionOperation: FilterCompositionOperation) {
        self.filterTags = filterTags
        self.title = title
        self.compositionOperation
    }
}
