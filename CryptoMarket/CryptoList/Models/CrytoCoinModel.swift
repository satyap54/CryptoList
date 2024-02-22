//
//  CrytoCoinModel.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

struct CrytoCoinModel: Codable {
    let name: String
    let symbol: String
    let isNew: Bool
    let isActive: Bool
    let type: CryptoCurrencyType
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case isNew = "is_new"
        case isActive = "is_active"
        case type = "type"
    }
    
    init(cryptoCoinEntity: CryptoCoinEntity) {
        self.name = cryptoCoinEntity.name!
        self.symbol = cryptoCoinEntity.symbol!
        self.isNew = cryptoCoinEntity.isNew
        self.isActive = cryptoCoinEntity.isActive
        self.type = CryptoCurrencyType(rawValue: cryptoCoinEntity.typeValue!)!
    }
}
