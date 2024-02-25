//
//  CryptoCoinFilterModelRegistry.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation

final class CryptoCoinFilterModelRegistry {
    private(set) var filterModels: [FilterModel]
    
    init() {
        self.filterModels = []
        self.createFilterModels()
    }
    
    private func createFilterModels() {
        filterModels.append(self.createNewCoinsFilterModel())
        filterModels.append(self.createOnlyCoinsFilterModel())
        filterModels.append(self.createActiveCoinsFilterModel())
        filterModels.append(self.createOnlyTokenFilterModel())
        filterModels.append(self.createInactiveCoinsFilterModel())
    }
    
    private func createInactiveCoinsFilterModel() -> FilterModel {
        let filterTags: [FilterTag] = [
            .init(lhs: "typeValue", rhs: CryptoCurrencyType.coin.rawValue),
            .init(lhs: "isActive", rhs: "\(NSNumber(value: false))")
        ]
        return FilterModel(filterTags: filterTags,
                           title: "Inactive Coins",
                           compositionOperation: .or)
    }
    
    private func createActiveCoinsFilterModel() -> FilterModel {
        let filterTags: [FilterTag] = [
            .init(lhs: "typeValue", rhs: CryptoCurrencyType.coin.rawValue),
            .init(lhs: "isActive", rhs: "\(NSNumber(value: true))")
        ]
        return FilterModel(filterTags: filterTags,
                           title: "Inactive Coins",
                           compositionOperation: .or)
    }
    
    private func createOnlyTokenFilterModel() -> FilterModel {
        let filterTags: [FilterTag] = [
            .init(lhs: "typeValue", rhs: CryptoCurrencyType.token.rawValue)
        ]
        return FilterModel(filterTags: filterTags,
                           title: "Only Tokens",
                           compositionOperation: .or)
    }
    
    private func createOnlyCoinsFilterModel() -> FilterModel {
        let filterTags: [FilterTag] = [
            .init(lhs: "typeValue", rhs: CryptoCurrencyType.coin.rawValue)
        ]
        return FilterModel(filterTags: filterTags,
                           title: "Only Coins",
                           compositionOperation: .or)
    }
    
    private func createNewCoinsFilterModel() -> FilterModel {
        let filterTags: [FilterTag] = [
            .init(lhs: "typeValue", rhs: CryptoCurrencyType.coin.rawValue),
            .init(lhs: "isNew", rhs: "\(NSNumber(value: true))")
        ]
        return FilterModel(filterTags: filterTags,
                           title: "New Coins",
                           compositionOperation: .or)
    }
}
