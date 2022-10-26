//
//  PlanetListItem.swift
//  planets
//
//  Created by Mohamed Shafraz on 2022-10-25.
//

import SwiftUI

struct PlanetListItem: View {
    @StateObject var viewModel: PlanetInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(viewModel.name)
                .font(.system(size: 16, weight: .bold))
            Text(viewModel.climate)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
        }
    }
}

struct PlanetListItem_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListItem(viewModel: PlanetInfoViewModel(planet: Planet(name: "Tatooine", climate: "arid", orbitalPeriod: "304", gravity: "1 standard")))
    }
}
