//
//  Planet.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import Foundation

struct Planet: Codable, Equatable {
    let name: String
    let climate: String
    let orbitalPeriod: String
    let gravity: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case climate
        case orbitalPeriod = "orbital_period"
        case gravity
    }
}
