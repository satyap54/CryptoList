//
//  CryptoListViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation
import UIKit


final class CryptoListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    private func setupView() {
        
    }
}
