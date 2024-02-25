//
//  CryptoListTableViewCell.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 23/02/24.
//

import CommonCodeUtility
import Foundation
import UIKit


final class CryptoListTableViewCell: UITableViewCell {
    static let reuseIdentifier = "TableViewCell"
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontsLib.mediumFontWithSize(FontsLib.titleFontSize)
        titleLabel.textColor = ColorLib.black[0]
        return titleLabel
    }()
    
    private let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = FontsLib.mediumFontWithSize(FontsLib.subTitleFontSize)
        subTitleLabel.textColor = ColorLib.black[4]
        return subTitleLabel
    }()
    
    private let iconImageView: UIImageView = {
        return UIImageView()
    }()
    
    private let tagImageView: UIImageView = {
        let tagImageView = UIImageView()
        tagImageView.image = UIImage(named: "NewTag")
        return tagImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let titleSubtitlePlaceHolderView = UIView()
        titleSubtitlePlaceHolderView.addSubview(self.titleLabel)
        titleSubtitlePlaceHolderView.addSubview(self.subTitleLabel)
        
        self.contentView.addSubview(titleSubtitlePlaceHolderView)
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.tagImageView)
        
        titleSubtitlePlaceHolderView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalToSuperview().offset(8.0)
        }
        
        self.subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(2.0)
            make.leading.trailing.equalTo(self.titleLabel)
            make.bottom.equalToSuperview().offset(-8.0)
        }
        
        self.iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleSubtitlePlaceHolderView)
            make.height.width.equalTo(36.0)
            make.leading.greaterThanOrEqualTo(titleSubtitlePlaceHolderView.snp.trailing).offset(8.0)
            make.trailing.equalToSuperview().offset(-32.0)
        }
    }
    
    func configure(with cryptoCoinModel: CrytoCoinModel) {
        self.titleLabel.text = (cryptoCoinModel.name)
        self.subTitleLabel.text = cryptoCoinModel.symbol
        self.tagImageView.isHidden = !cryptoCoinModel.isActive
        
        if cryptoCoinModel.type == .coin {
            if cryptoCoinModel.isActive {
                self.iconImageView.image = UIImage(named: "ActiveCoin")
            } else {
                self.iconImageView.image = UIImage(named: "InactiveCoin")
            }
        } else {
            self.iconImageView.image = UIImage(named: "ActiveToken")
        }
    }
}
