//
//  CarsApiServiceProvider.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CarsApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://us-central1-cars-api-90722.cloudfunctions.net/cars"
    
    init() {
        super.init(method: .get, baseUrl: Self.url, path: nil, data: nil)
    }
    
}
