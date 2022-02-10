//
//  HomeView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home")
                .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
