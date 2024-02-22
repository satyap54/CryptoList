//
//  ViewController.swift
//  CryptoMarket
//
//  Created by Satyabrat Panda on 21/02/24.
//

import UIKit

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
    let service = LocalCryptoCoinsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

