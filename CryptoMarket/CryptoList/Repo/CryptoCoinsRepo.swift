//
//  CryptoCoinsRepo.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation
import CoreData

protocol CryptoCoinsRepoProtocol {
    var coreDataManager: CoreDataManagerProtocol { get }
    
    func checkIfCached() -> Bool
    func save(cryptoCoinDatas: [CrytoCoinModel])
}

final class CryptoCoinsRepo: CryptoCoinsRepoProtocol {
    private(set) var coreDataManager: CoreDataManagerProtocol
    
    private lazy var moc = self.coreDataManager.mainManagedObjectContext
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    func checkIfCached() -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CryptoCoinEntity")
        do {
            let count = try coreDataManager.mainManagedObjectContext.count(for: fetchRequest)
            return count != 0
        } catch {
            print("Error checking cache: \(error)")
            return false
        }
    }
    
    func save(cryptoCoinDatas: [CrytoCoinModel]) {
        _ = cryptoCoinDatas.map { cryptoCoinData in
            let crytoCoinEntity = CryptoCoinEntity(context: self.moc)
            crytoCoinEntity.isActive = cryptoCoinData.isActive
            crytoCoinEntity.isNew = cryptoCoinData.isNew
            crytoCoinEntity.name = cryptoCoinData.name
            crytoCoinEntity.symbol = cryptoCoinData.symbol
            crytoCoinEntity.typeValue = cryptoCoinData.type.rawValue
        }
        
        self.coreDataManager.saveChangesMadeinMainMoc()
    }
}
