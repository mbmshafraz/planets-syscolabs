//
//  PlanetInfoViewModel.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import Foundation
import Combine

class PlanetInfoViewModel: ObservableObject {
    @Published var name: String
    @Published var climate: String
    @Published var orbitalPeriod: String
    @Published var gravity: String
    
    private let planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
        name = planet.name
        climate = planet.climate
        orbitalPeriod = planet.orbitalPeriod
        gravity = planet.gravity
    }
}
