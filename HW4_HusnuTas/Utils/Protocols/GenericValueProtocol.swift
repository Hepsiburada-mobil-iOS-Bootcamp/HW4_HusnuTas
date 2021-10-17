//
//  GenericValueProtocal.swift
//  HW2_HusnuTas
//
//  Created by Hüsnü Taş on 29.09.2021.
//

import Foundation

protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
    
}
