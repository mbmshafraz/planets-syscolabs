//
//  PlanetListViewModel.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import Foundation
import Combine

class PlanetListViewModel: ObservableObject {
    @Published var planets = [Planet]()
    private var previous: String?
    private var next: String?
    
    func fetchPlanets() {
        LocalDataSource.shared.fetchPlanets {[weak self] planetList in
            DispatchQueue.main.async {
                self?.next = planetList.next
                self?.previous = planetList.previous
                
                //Make sure not replicating
                for planet in planetList.planets {
                    if !(self?.planets.contains(where: { $0.name == planet.name }) ?? false) {
                        self?.planets.append(planet)
                    }
                }
            }
        }
        
        RemoteDataSource.shared.fetchPlanets {[weak self]  planetList in
            LocalDataSource.shared.save(planetList: planetList)
            DispatchQueue.main.async {
                self?.next = planetList.next
                self?.previous = planetList.previous
                
                //Make sure not replicating
                for planet in planetList.planets {
                    if !(self?.planets.contains(where: { $0.name == planet.name }) ?? false) {
                        self?.planets.append(planet)
                    }
                }
            }
        }
    }
    
    func fetchNext() {
        if let next {
            LocalDataSource.shared.fetchPlanets(url: next) { [weak self] planetList in
                DispatchQueue.main.async {
                    self?.next = planetList.next
                    self?.previous = planetList.previous
                    
                    //Make sure not replicating
                    for planet in planetList.planets {
                        if !(self?.planets.contains(where: { $0.name == planet.name }) ?? false) {
                            self?.planets.append(planet)
                        }
                    }
                }
            }

            RemoteDataSource.shared.fetchPlanets(url: next) { [weak self] planetList in
                DispatchQueue.main.async {
                    self?.next = planetList.next
                    self?.previous = planetList.previous
                    
                    //Make sure not replicating
                    for planet in planetList.planets {
                        if !(self?.planets.contains(where: { $0.name == planet.name }) ?? false) {
                            self?.planets.append(planet)
                        }
                    }
                }
            }
        }
    }
}

