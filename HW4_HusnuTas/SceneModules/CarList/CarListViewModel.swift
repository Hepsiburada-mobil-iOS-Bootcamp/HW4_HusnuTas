//
//  CarListViewModel.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import UIKit
import DefaultNetworkOperationPackage

typealias CarsCompletionBlock = (Cars) -> Void
typealias CarsResultBlock = (Result<Cars, ErrorResponse>) -> Void

class CarListViewModel {
    
    /// Gets Cars data from API
    func fetchCars(completion: @escaping CarsResultBlock) {

        do {
            let urlRequest = try CarsApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("ERROR: \(error)")
        }
        
    }
    
}
