//
//  CryptoFilterViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import Foundation
import UIKit

final class CryptoFilterViewController: UIViewController {
    private let viewModel: CryptoFilterViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: CryptoFilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupView()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.applyFilter(sender:)), for: .touchUpInside)
        button.setTitle("Tap", for: .normal)
        return button
    }()
    
    private func setupView() {
        self.view.addSubview(button)
        self.button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.viewModel.toggleFilterAt(idx: 2)
        }
    }
    
    @objc
    func applyFilter(sender: UIButton) {
        self.viewModel.toggleFilterAt(idx: 2)
    }
}
