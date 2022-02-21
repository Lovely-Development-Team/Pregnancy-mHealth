//
//  HomeView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//


import SwiftUI

struct HomeView: View {
    
    @State private var notificationsAuthorised: Bool? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                if let notificationsAuthorised = notificationsAuthorised {
                    if notificationsAuthorised {
                        Text("Notifications Enabled")
                    } else {
                        Text("Notifications Not Authorized")
                    }
                } else {
                    Button(action: {
                        let center = UNUserNotificationCenter.current()
                        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                            if let error = error {
                                // Handle error
                            }
                            self.notificationsAuthorised = granted
                        }
                    }) {
                        Text("Enable Notifications")
                    }
                }
                }
                .padding(.top, 20)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
