//
//  Car.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import Foundation

// MARK: - Car
struct Car: Codable {
    let id: Int
    let title, brand, model: String
    let year: Int
    let color, engine: String
    let photo: Photo
}

// MARK: - Photo
struct Photo: Codable {
    let thumbnail: String
}

typealias Cars = [Car]
