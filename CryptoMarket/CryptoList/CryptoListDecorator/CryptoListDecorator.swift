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
}

final class CryptoListDecorator: CryptoListDecoratorProtocol {
    private var filterModels: [FilterModel]
    
    init() {
        self.filterModels = []
    }
    
    func getPredicate() -> NSPredicate {
        var andPredicates: [NSPredicate] = []
        var orPredicates: [NSPredicate] = []
        
        for filterModel in filterModels {
            let unitPredicates = filterModel.filterTags.map {
                return NSPredicate(format: "@lhs == @rhs", $0.lhs, $0.rhs)
            }
            let compoundPredicateOfThisFilter = NSCompoundPredicate(andPredicateWithSubpredicates: unitPredicates)
            if filterModel.compositionOperation == .or {
                orPredicates.append(compoundPredicateOfThisFilter)
            } else {
                andPredicates.append(compoundPredicateOfThisFilter)
            }
        }
        
        let orPredicatesCombined = NSCompoundPredicate(orPredicateWithSubpredicates: orPredicates)
        andPredicates.append(orPredicatesCombined)
        let resultantPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: andPredicates)
        
        return resultantPredicate
    }
    
    func addFilterModel(filterModel: FilterModel) {
        self.filterModels.append(filterModel)
    }
    
    func removeFilterModel(filterModel: FilterModel) {
        self.filterModels.removeAll(where: { $0 == filterModel })
    }
    
   
}
