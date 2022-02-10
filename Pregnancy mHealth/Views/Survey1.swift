//
//  Survey1.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct SurveyQuestion: View {
    
    let question: String
    let answers: [String]
    let multiple: Bool
    
    @State private var selectedAnswer: String = ""
    @State private var selectedAnswers: Set<String> = []
    @State private var otherText = ""
    
    func isSelected(_ answer: String) -> Bool {
        if multiple {
            return selectedAnswers.contains(answer)
        } else {
            return selectedAnswer == answer
        }
    }
    
    var body: some View {
        Section {
            Text(question)
                .fontWeight(.bold)
                .padding(.vertical, 5)
            ForEach(answers, id: \.self) { answer in
                Button(action: {
                    withAnimation {
                        if multiple {
                            if selectedAnswers.contains(answer) {
                                selectedAnswers.remove(answer)
                            } else {
                                selectedAnswers.insert(answer)
                            }
                        } else {
                            selectedAnswer = answer
                        }
                    }
                }) {
                    HStack {
                        Text(answer)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: isSelected(answer) ? (multiple ? "checkmark.square.fill" : "checkmark.circle.fill") : (multiple ? "square" : "circle"))
                            .foregroundColor(.accentColor)
                    }
                    .contentShape(Rectangle())
                }
            }
            if selectedAnswers.contains("Other") {
                TextField("Please enter a reason", text: $otherText)
            }
        }
    }
    
}

struct Survey1: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingAlert = false
    @State private var stepperValue = 1
    @State private var sliderValue: Double = 2
    @State private var textField = ""
    
    @ViewBuilder
    var submitButton: some View {
        Button(action: {
            showingAlert = true
        }) {
            Text("Submit")
                .font(.body)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(FilledButton())
    }
    
    func hideKeyboard() {
       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("Please answer all the questions and submit the survey once complete.").font(.body).offset(x: -20).foregroundColor(.primary).padding(.top, 5)) {

                }
                SurveyQuestion(question: "What is your current employment status?", answers: [
                    "Full-time",
                    "Part-time",
                    "Retired",
                    "Unemployed",
                ], multiple: false
                )
                Section {
                    Text("How many people (including yourself) live in your home?")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    TextField("Please enter a number", text: $textField)
                        .keyboardType(.numbersAndPunctuation)
                }
                Section {
                    Text("Some slidey question to answer?")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    HStack(spacing: 20) {
                        Text("\(Int(sliderValue))")
                            .frame(width: 20, alignment: .leading)
                        Slider(value: $sliderValue, in: 0...6, step: 1)
                    }
                }
                SurveyQuestion(question: "What barriers do you have to purchasing healthy food options?", answers: [
                    "Transportation",
                    "Cost/high prices",
                    "Refrigeration/storage at home",
                    "Difficulty preparing",
                    "Personal preference",
                    "Limited availability where I shop",
                    "Other",
                ], multiple: true
                )
                
                Section(footer: submitButton) {}
                
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("Demographic Survey")
            .alert("Thank you for submitting the survey!", isPresented: $showingAlert) {
                Button("No problem", role: .cancel) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct Survey1_Previews: PreviewProvider {
    static var previews: some View {
        Survey1()
    }
}
