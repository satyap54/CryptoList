//
//  CryptoListDecorator.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

protocol CryptoListDecoratorProtocol {
    func getPredicate() -> NSPredicate?
    func addFilterModel(filterModel: FilterModel)
    func removeFilterModel(filterModel: FilterModel)
    func clear()
}

final class CryptoListDecorator: CryptoListDecoratorProtocol {
    private var filterModels: [FilterModel]
    
    init() {
        self.filterModels = []
    }
    
    func getPredicate() -> NSPredicate? {
        if filterModels.isEmpty {
            return nil
        }
        var resultantPredicate: NSPredicate? = nil
        
        for filterModel in filterModels {
            let resultantUnitPredicatesOfCurrentFilterModel = filterModel.filterTags.map {
                return NSPredicate(format: "%K == %@", $0.lhs as NSString, $0.rhs as NSString)
            }
            let resultantCompoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: resultantUnitPredicatesOfCurrentFilterModel)
            let subPredicatesSoFar: [NSPredicate] = [resultantPredicate, resultantCompoundPredicate].compactMap { $0 }
            if filterModel.compositionOperation == .or {
                resultantPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: subPredicatesSoFar)
            } else {
                resultantPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: subPredicatesSoFar)
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
