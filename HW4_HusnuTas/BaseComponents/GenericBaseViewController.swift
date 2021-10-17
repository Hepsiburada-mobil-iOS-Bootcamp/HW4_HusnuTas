//
//  GenericBaseViewController.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import UIKit

class GenericBaseViewController<V>: UIViewController {
    
    var viewModel: V!
    
    convenience init(viewModel: V) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
    }
    
    func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
    }
    
}
