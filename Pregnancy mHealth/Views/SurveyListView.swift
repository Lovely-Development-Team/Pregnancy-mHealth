//
//  SurveyListView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct SurveyButton: View {
    
    let surveyName: String
    let icon: String
    let onTap: () -> ()
    
    var body: some View {
        
        Button(action: onTap) {
            VStack(alignment: .leading) {
                Image(systemName: icon)
                Spacer()
                Text(surveyName)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .frame(minHeight: 80, alignment: .bottom)
        }
        .buttonStyle(FilledButton())
        
    }
    
}

struct SurveyListView: View {
    
    @State private var showSurvey1 = false
    @State private var showSurvey2 = false
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    SurveyButton(surveyName: "Demographic Survey", icon: "checklist") {
                        showSurvey1 = true
                    }
                    SurveyButton(surveyName: "ASA24", icon: "leaf") {
                        showSurvey2 = true
                    }
                }
            }
            .padding()
            .navigationTitle("Surveys")
        }
        .sheet(isPresented: $showSurvey1) {
            Survey1()
        }
        .sheet(isPresented: $showSurvey2) {
            Survey2()
        }
    }
}

struct SurveyListView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyListView()
    }
}
