//
//  CryptoFilterViewModel.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation

final class CryptoFilterViewModel {
    private let dataSource: CryptoListDataSourceProtocol
    private let filterRegistry: CryptoCoinFilterModelRegistry
    private var cryptoListDecorator: CryptoListDecoratorProtocol?
    
    private var isFilterModelSelected: [Bool]
    
    init(dataSource: CryptoListDataSourceProtocol, filterRegistry: CryptoCoinFilterModelRegistry) {
        self.dataSource = dataSource
        self.filterRegistry = filterRegistry
        self.isFilterModelSelected = Array(repeating: false, count: filterRegistry.filterModels.count) as! [Bool]
    }
    
    func toggleFilterAt(idx: Int) {
        self.isFilterModelSelected[idx].toggle()
        let filterModelAtGivenIdx = self.filterRegistry.filterModels[idx]
        
        guard let cryptoListDecorator else {
            return
        }
        
        if self.isFilterModelSelected[idx] {
            cryptoListDecorator.addFilterModel(filterModel: filterModelAtGivenIdx)
        } else {
            cryptoListDecorator.removeFilterModel(filterModel: filterModelAtGivenIdx)
        }
        
        let predicate = cryptoListDecorator.getPredicate()
        self.dataSource.updateDataSource(with: cryptoListDecorator)
    }
    
    func getCountOfFilterModels() -> Int {
        return self.filterRegistry.filterModels.count
    }
    
    func getFilterModel(at idx: Int) -> FilterModel {
        return self.filterRegistry.filterModels[idx]
    }
}
