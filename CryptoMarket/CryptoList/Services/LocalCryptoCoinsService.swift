//
//  MockCryptoCoinsService.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation

final class LocalCryptoCoinsService: CryptoCoinsServiceProtocol {
    struct Constants {
        static let baseURL = "https://run.mocky.io/"
        
        struct FetchCryptoList {
            static let serviceURL = "v3/ac7d7699-a7f7-488b-9386-90d1a60c4a4b"
        }
    }
    
    func getCryptoCoinsInfo(completion: @escaping ([CrytoCoinModel]) -> Void) {
        guard let path = Bundle.main.url(forResource: "MockData", withExtension: "json"),
              let jsonData = try? String(contentsOf: path, encoding: String.Encoding.utf8),
              let decodedData = try? JSONDecoder().decode(CrytoCoinResponseList.self, from: jsonData.data(using: .utf8)!) else {
            completion([])
            return
        }
        
        completion(decodedData.cryptocurrencies)
    }
}
