//
//  PlanetListView.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import SwiftUI

struct PlanetListView: View {
    @StateObject var viewModel = PlanetListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (alignment: .leading) {
                    ForEach(viewModel.planets, id: \.name) { planet in
                        NavigationLink(
                            destination: PlanetDetailView(viewModel: PlanetInfoViewModel(planet: planet))) {
                                PlanetListItem(viewModel: PlanetInfoViewModel(planet: planet))
                                    .padding([.top,.bottom],8)
                        }
                        .onAppear {
                            if viewModel.planets.last?.name == planet.name {
                                viewModel.fetchNext()
                            }
                        }
                        
                    }
                }.padding([.all], 16)
            }
            .onAppear{
                viewModel.fetchPlanets()
            }
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
