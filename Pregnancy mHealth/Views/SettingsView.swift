//
//  SettingsView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 09/02/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var toggle1 = true
    @State private var toggle2 = false
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: EmptyView()) {
                        Text("Notifications")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Survey History")
                    }
                }
                Section {
                    NavigationLink(destination: EmptyView()) {
                        Text("FAQ")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Help")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Contact Us")
                    }
                }
                Section {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown") (\(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"))")
                            .foregroundColor(.secondary)
                    }
                }
                Section {
                    Button(action: { showingAlert = true }) {
                        Text("Reset All Settings")
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .alert("Settings have been reset.", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
