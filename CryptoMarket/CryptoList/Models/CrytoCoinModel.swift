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
}
