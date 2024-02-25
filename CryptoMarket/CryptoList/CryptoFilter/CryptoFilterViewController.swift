//
//  CryptoFilterViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import CommonCodeUtility
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
    }
    
    private let containerViewOfRows: UIStackView = {
        let stackView = UIStackView();
        stackView.axis = .vertical
        stackView.spacing = 2.0
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap", for: .normal)
        return button
    }()
    
    private func createRowView() -> UIStackView {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.spacing = 8.0
        return stackView
    }
    
    private func createFilterButtonView(of filterModel: FilterModel, with id: Int) -> FilterButtonView {
        let button = FilterButtonView(filterId: id)
        button.setTitle(filterModel.title, for: .normal)
        button.addTarget(self, action: #selector(self.didTapFilterButton(sender:)), for: .touchUpInside)
        return button
    }
    
    private func createFilterModelLayout() -> [[FilterModel]] {
        let maxFilterModelsInARow = 3
        var currentIdxOfFilterModel = 0
        var result: [[FilterModel]] = []
        let filterModels = (0..<self.viewModel.getCountOfFilterModels()).compactMap {
            return self.viewModel.getFilterModel(at: $0)
        }
        
        while(currentIdxOfFilterModel < self.viewModel.getCountOfFilterModels()) {
            let rightLimitOfSlice = min(currentIdxOfFilterModel + maxFilterModelsInARow, self.viewModel.getCountOfFilterModels())
            let subList = Array(filterModels[currentIdxOfFilterModel..<rightLimitOfSlice])
            result.append(subList)
            currentIdxOfFilterModel = rightLimitOfSlice
        }
        return result
    }
    
    private func setupView() {
        self.view.backgroundColor = ColorLib.white[2]
        self.view.addSubview(containerViewOfRows)
        
        self.containerViewOfRows.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview().inset(8.0)
        }
        
        let filterModelsWithLayout = self.createFilterModelLayout()
        var filterButtonIdx = 0
        filterModelsWithLayout.forEach { filterModelsInCurrentRow in
            let filtersRowView = self.createRowView()
            filterModelsInCurrentRow.forEach { filterModel in
                let filterButtonView = self.createFilterButtonView(of: filterModel, with: filterButtonIdx)
                filterButtonIdx += 1
                filtersRowView.addArrangedSubview(filterButtonView)
            }
            self.containerViewOfRows.addArrangedSubview(filtersRowView)
        }
    }
    
    @objc
    func didTapFilterButton(sender: FilterButtonView) {
        self.viewModel.toggleFilterAt(idx: sender.filterId)
        if self.viewModel.isFilterModelSelected[sender.filterId] {
            sender.highlight()
        } else {
            sender.unhighlight()
        }
    }
}
