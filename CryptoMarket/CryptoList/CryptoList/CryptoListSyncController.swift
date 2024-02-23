//
//  CryptoListSyncController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation

protocol CryptoListSyncControllerProtocol {
    func sync(completion: @escaping () -> Void)
}

final class CryptoListSyncController: CryptoListSyncControllerProtocol {
    private let repo: CryptoCoinsRepoProtocol
    private let service: CryptoCoinsServiceProtocol
    
    init(repo: CryptoCoinsRepoProtocol, 
         service: CryptoCoinsServiceProtocol) {
        self.repo = repo
        self.service = service
    }
    
    private func checkIfCryptpListEntriesExist() -> Bool {
        return self.repo.checkIfCached()
    }
    
    func sync(completion: @escaping () -> Void) {
        let isCached = self.checkIfCryptpListEntriesExist()
        if isCached {
            completion()
            return
        }
        
        self.service.getCryptoCoinsInfo { [weak self] cryptoCoinModels in
            self?.repo.save(cryptoCoinDatas: cryptoCoinModels)
            completion()
        }
    }
}
