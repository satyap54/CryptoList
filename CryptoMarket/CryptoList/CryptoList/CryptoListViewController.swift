//
//  CryptoListViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import CommonCodeUtility
import Foundation
import UIKit


final class CryptoListViewController: UIViewController {
    private let viewModel: CryptoListViewModel
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CryptoListTableViewCell.self, forCellReuseIdentifier: CryptoListTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: CryptoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.setDataSourceDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.startSync {
            // do nothing
        }
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        self.view.addSubview(self.tableView)
        self.view.backgroundColor = ColorLib.white[0]
        
        self.tableView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension CryptoListViewController: UITableViewDelegate {
    
}

extension CryptoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource.getNumberOfObjects()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoListTableViewCell.reuseIdentifier, for: indexPath) as? CryptoListTableViewCell else {
            return UITableViewCell()
        }
        let cryptoCoinModel = self.viewModel.dataSource.getCryptoCoinModel(at: indexPath)
        cell.configure(with: cryptoCoinModel)
        return cell
    }
}

extension CryptoListViewController: CryptoListDataSourceDelegateProtocol {
    func didChange() {
        self.tableView.beginUpdates()
    }
    
    func willChange() {
        self.tableView.endUpdates()
    }
    
    func refreshedData() {
        self.tableView.reloadData()
    }
}
