//
//  AppCoordinator.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 26/02/24.
//

import CommonCodeUtility
import Foundation
import UIKit

final class AppCoordinator {
    private func createNavigationViewController(_ vc: UIViewController) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: vc)
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: ColorLib.white[4],
            .font: FontsLib.mediumFontWithSize(FontsLib.titleFontSize)
        ]
        navigationBarAppearance.backgroundColor = ColorLib.info[3]
        
        navigationVC.navigationBar.standardAppearance = navigationBarAppearance
        navigationVC.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        return navigationVC
    }
    
    func start() -> UINavigationController {
        let dataSource: CryptoListDataSource = CryptoListDataSource(coreDataManager: CoreDataManager.shared)
        
        let filterCoordinator = CryptoFilterCoordinator(dataSource: dataSource)
        let listCoordinator = CryptoListCoordinator(dataSource: dataSource)
        
        let listVC = listCoordinator.createViewController()
        let filtetVC = filterCoordinator.getViewController()
        
        let vc = ViewController(listVC: listVC, filterVC: filtetVC)
        let navigationVC = self.createNavigationViewController(vc)
        
        return navigationVC
    }
}
