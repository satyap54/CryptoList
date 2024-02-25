//
//  File.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 24/02/24.
//

import Foundation
import UIKit

final class CryptoFilterCoordinator {
    private let dataSource: CryptoListDataSourceProtocol
    
    init(dataSource: CryptoListDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getViewController() -> UIViewController {
        let listDecorator = CryptoListDecorator()
        let viewModel = CryptoFilterViewModel(dataSource: dataSource,
                                              filterRegistry: CryptoCoinFilterModelRegistry())
        viewModel.cryptoListDecorator = listDecorator
        let viewController = CryptoFilterViewController(viewModel: viewModel)
        return viewController
    }
}
