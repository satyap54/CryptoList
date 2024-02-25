//
//  ViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 21/02/24.
//

import UIKit
import SnapKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(listVC: UIViewController,
         filterVC: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.add(listVC)
        self.add(filterVC)
        self.setupView(listVC: listVC, filterVC: filterVC)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(listVC: UIViewController, filterVC: UIViewController) {
        let listView = listVC.view!
        let filterView = filterVC.view!
        
        listView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        filterView.snp.makeConstraints { make in
            make.top.equalTo(listView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

