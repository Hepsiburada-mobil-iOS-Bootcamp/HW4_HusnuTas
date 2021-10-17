//
//  CarListViewBuilder.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import Foundation

class CarListViewBuilder {
    
    class func build(viewModel: CarListViewModel) -> CarListViewController {
        return CarListViewController(viewModel: viewModel)
    }
    
}
