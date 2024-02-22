//
//  CryptoListDecorator.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

protocol CryptoListDecoratorProtocol {
    func getPredicate() -> NSPredicate
    func addFilterModel(filterModel: FilterModel)
    func removeFilterModel(filterModel: FilterModel)
    func clear()
}

final class CryptoListDecorator: CryptoListDecoratorProtocol {
    private var filterModels: [FilterModel]
    
    init() {
        self.filterModels = []
    }
    
    func getPredicate() -> NSPredicate {
        var resultantPredicate: NSCompoundPredicate = NSCompoundPredicate()
        
        for filterModel in filterModels {
            var resultantUnitPredicate = NSCompoundPredicate()
            filterModel.filterTags.forEach {
                let unitPredicate = NSPredicate(format: "@lhs == @rhs", $0.lhs, $0.rhs)
                resultantUnitPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [resultantUnitPredicate, unitPredicate])
            }
            if filterModel.compositionOperation == .or {
                resultantPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [resultantPredicate, resultantUnitPredicate])
            } else {
                resultantPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [resultantPredicate, resultantUnitPredicate])
            }
        }
        
        return resultantPredicate
    }
    
    func addFilterModel(filterModel: FilterModel) {
        self.filterModels.append(filterModel)
    }
    
    func removeFilterModel(filterModel: FilterModel) {
        self.filterModels.removeAll(where: { $0 == filterModel })
    }
    
    func clear() {
        self.filterModels = []
    }
}
