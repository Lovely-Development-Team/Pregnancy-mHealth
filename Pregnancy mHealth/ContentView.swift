//
//  ContentView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScreening = true
    @State private var showTerms = true
    @State private var selectedTab = 0
    
    var body: some View {
        if showScreening {
            ScreeningView(showScreening: $showScreening)
        } else if showTerms {
            TermsView(showTerms: $showTerms)
        } else {
            TabView(selection: $selectedTab) {
                SurveyListView()
                    .tabItem { Label("Surveys", systemImage: "checklist")}
                    .tag(0)
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(1)
                SettingsView()
                    .tabItem { Label("Settings", systemImage: "gear") }
                    .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
