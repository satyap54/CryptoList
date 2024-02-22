//
//  CryptoListViewModel.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation


final class CryptoListViewModel {
    let dataSource: CryptoListDataSourceProtocol
    private let syncController: CryptoListSyncControllerProtocol
    
    init(dataSource: CryptoListDataSourceProtocol, 
         syncController: CryptoListSyncControllerProtocol) {
        self.dataSource = dataSource
        self.syncController = syncController
    }
    
    func setDataSourceDelegate(delegate: CryptoListDataSourceDelegateProtocol) {
        self.dataSource.delegate = delegate
    }
    
    func startSync(completion: @escaping () -> Void) {
        self.syncController.sync(completion: completion)
    }
}
