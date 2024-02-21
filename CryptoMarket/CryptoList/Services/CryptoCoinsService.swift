//
//  CryptoCoinsService.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 22/02/24.
//

import Foundation


protocol CryptoCoinsServiceProtocol {
    func getCryptoCoinsInfo(completion: @escaping ([CrytoCoinModel]) -> Void)
}

final class CryptoCoinsService: CryptoCoinsServiceProtocol {
    struct Constants {
        static let baseURL = "https://run.mocky.io/"
        
        struct FetchCryptoList {
            static let serviceURL = "v3/ac7d7699-a7f7-488b-9386-90d1a60c4a4b"
        }
    }
    
    func getCryptoCoinsInfo(completion: @escaping ([CrytoCoinModel]) -> Void) {
        let fetchCoinURLText = Constants.baseURL + Constants.FetchCryptoList.serviceURL
        let url = URL(string: fetchCoinURLText)!
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data else {
                completion([])
                return
            }
            
            completion([])
        }
        dataTask.resume()
    }
}
