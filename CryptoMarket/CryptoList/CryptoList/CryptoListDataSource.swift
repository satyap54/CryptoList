//
//  CryptoListDataSource.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation
import CoreData

protocol CryptoListDataSourceDelegateProtocol {
    func willChange()
    func didChange()
}

protocol CryptoListDataSourceProtocol: AnyObject {
    func getCryptoCoinModel(at index: IndexPath) -> CrytoCoinModel
    func updateDataSource(with decorator: CryptoListDecoratorProtocol)
    func getNumberOfObjects() -> Int
}

final class CryptoListDataSource: NSObject, CryptoListDataSourceProtocol {
    var delegate: CryptoListDataSourceDelegateProtocol?
    
    private let coreDataManager: CoreDataManagerProtocol
    
    private lazy var fetchController: NSFetchedResultsController<CryptoCoinEntity> = {
        let fetchRequest = NSFetchRequest<CryptoCoinEntity>(entityName: "CryptoCoinEntity")
        fetchRequest.fetchBatchSize = 20
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataManager.mainManagedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchResultsController
    }()
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    func getCryptoCoinModel(at index: IndexPath) -> CrytoCoinModel {
        let cryptoCoinEntity = self.fetchController.object(at: index)
        let cryptoCoinModel = CrytoCoinModel(cryptoCoinEntity: cryptoCoinEntity)
        return cryptoCoinModel
    }
    
    func updateDataSource(with decorator: CryptoListDecoratorProtocol) {
        self.fetchController.fetchRequest.predicate = decorator.getPredicate()
        try? self.fetchController.performFetch()
    }
    
    func getNumberOfObjects() -> Int {
        return self.fetchController.sections![0].numberOfObjects
    }
}

extension CryptoListDataSource: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.delegate?.willChange()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.delegate?.didChange()
    }
}
