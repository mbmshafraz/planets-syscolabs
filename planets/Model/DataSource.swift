//
//  DataSource.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import Foundation
import Alamofire

fileprivate let api = "https://swapi.dev/api/planets"

protocol DataSource {
    func fetchPlanets(completion: @escaping (PlanetList) -> Void)
    func fetchPlanets(url: String, completion: @escaping (PlanetList) -> Void)
}

extension DataSource {
    func fetchPlanets(completion: @escaping (PlanetList) -> Void) {
        fetchPlanets(url: api, completion: completion)
    }
}

class RemoteDataSource: DataSource {
    static let shared = RemoteDataSource()
    
    func fetchPlanets(url: String, completion: @escaping (PlanetList) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: PlanetList.self) { (response) in
                guard let planetList = response.value else { return }
                completion(planetList)
            }
    }
}

class LocalDataSource : DataSource {
    static let shared = LocalDataSource()
    
    func save(planetList: PlanetList) {
        save(planetList: planetList, from: api)
    }
    
    func save(planetList: PlanetList, from url: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(planetList)
            UserDefaults.standard.set(data, forKey: url)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func fetchPlanets(url: String, completion: @escaping (PlanetList) -> Void) {
        if let data = UserDefaults.standard.data(forKey: url) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let planetList = try decoder.decode(PlanetList.self, from: data)
                completion(planetList)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
}
