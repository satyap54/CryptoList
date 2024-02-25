//
//  FilterButtonView.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 25/02/24.
//

import CommonCodeUtility
import Foundation
import UIKit


final class FilterButtonView: UIButton {
    let filterId: Int
    
    init(filterId: Int) {
        self.filterId = filterId
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 2.0
        self.contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        self.unhighlight()
    }
    
    func unhighlight() {
        self.backgroundColor = .clear
        self.layer.borderColor = ColorLib.black[3].cgColor
        self.setTitleColor(ColorLib.black[3], for: .normal)
    }
    
    func highlight() {
        self.backgroundColor = ColorLib.white[0]
        self.layer.borderColor = ColorLib.white[0].cgColor
    }
}
