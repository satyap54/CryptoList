//
//  CryptoListCoordinator.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation

final class CryptoListCoordinator {
    private let dataSource: CryptoListDataSourceProtocol
    weak var viewController: CryptoListViewController?
    
    init(dataSource: CryptoListDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func createViewController() ->  CryptoListViewController {
        let repo = CryptoCoinsRepo(coreDataManager: CoreDataManager.shared)
        let service = LocalCryptoCoinsService()
        let syncController = CryptoListSyncController(repo: repo, service: service)
        
        let viewModel = CryptoListViewModel(dataSource: dataSource, syncController: syncController)
        let viewController = CryptoListViewController(viewModel: viewModel)
        self.viewController = viewController
        return viewController
    }
}
