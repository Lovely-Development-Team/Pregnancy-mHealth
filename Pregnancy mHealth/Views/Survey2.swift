//
//  Survey2.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct Survey2: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            VStack {
                Text("The following survey takes place on an external site. Tap the button below to be taken to the site and complete the survey.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                Spacer()
                Button(action: {
                    openURL(URL(string: "https://asa24.nci.nih.gov/demo/")!)
                }) {
                    HStack {
                        Image(systemName: "link")
                        Text("Open Survey")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(FilledButton())
            }
            .padding()
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
                }
            }
            .navigationTitle("ASA24")
        }
    }
}

struct Survey2_Previews: PreviewProvider {
    static var previews: some View {
        Survey2()
    }
}
