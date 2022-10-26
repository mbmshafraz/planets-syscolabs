//
//  PlanetList.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import Foundation

struct PlanetList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let planets: [Planet]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case planets = "results"
    }
}
