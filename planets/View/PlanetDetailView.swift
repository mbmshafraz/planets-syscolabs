//
//  PlanetDetailView.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import SwiftUI

struct PlanetDetailView: View {
    @StateObject var viewModel: PlanetInfoViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Climate")
                        .font(.system(size: 16, weight: .bold))
                    Text(viewModel.climate)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Orbital Period")
                        .font(.system(size: 16, weight: .bold))
                    Text(viewModel.orbitalPeriod)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Gravity")
                        .font(.system(size: 16, weight: .bold))
                    Text(viewModel.gravity)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.name)
                        .font(.system(size: 18, weight: .bold))
                }
            }
        }

    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(viewModel: PlanetInfoViewModel(planet: Planet(name: "Tatooine", climate: "arid", orbitalPeriod: "304", gravity: "1 standard")))
    }
}
