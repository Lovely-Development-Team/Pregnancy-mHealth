//
//  TermsView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 09/02/2022.
//

import SwiftUI

struct BulletPoint: View {
    
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "circle.fill")
                .padding(.top, 5)
                .font(.caption)
            Text(text)
            Spacer()
        }
    }
    
}

struct TermsView: View {
    
    @Binding var showTerms: Bool
    
    @State var showSignature: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("What will be done in this study:")
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                Group {
                    BulletPoint(text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.")
                    BulletPoint(text: "Aliquam tincidunt mauris eu risus.")
                    BulletPoint(text: "Vestibulum auctor dapibus neque.")
                    BulletPoint(text: "Nunc dignissim risus id metus.")
                    BulletPoint(text: "Cras ornare tristique elit.")
                    BulletPoint(text: "Vivamus vestibulum ntulla nec ante.")
                    BulletPoint(text: "Praesent placerat risus quis eros.")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                Spacer()
                Button(action: {
                    showSignature = true
                }) {
                    Text("Continue")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(FilledButton())
            }
            .padding()
            .navigationTitle("Consent")
        }
        .sheet(isPresented: $showSignature) {
            ConsentView(showConsent: $showTerms)
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView(showTerms: .constant(true))
    }
}
