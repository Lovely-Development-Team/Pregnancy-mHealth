//
//  ScreeningView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct ScreeningView: View {
    
    @Binding var showScreening: Bool
    @State private var questionIndex = 0
    @State private var showingAlert = false
    
    private let questions: [String] = [
        "Are you over 19?",
        "Are you currently pregnant?",
    ]
    
    private var question: String {
        questions[questionIndex]
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text(question)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            HStack(spacing: 20) {
                Spacer()
                Button(action: {
                    showingAlert = true
                }) {
                    Text("No")
                }
                .buttonStyle(FilledButton())
                Button(action: {
                    if (questionIndex == 0) {
                        questionIndex = 1
                    } else {
                        showScreening = false
                    }
                }) {
                    Text("Yes")
                }
                .buttonStyle(FilledButton())
                Spacer()
            }
            .font(.title)
            Spacer()
        }
        .padding(20)
        .alert("This app is not for you.", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ScreeningView_Previews: PreviewProvider {
    static var previews: some View {
        ScreeningView(showScreening: .constant(true))
    }
}
