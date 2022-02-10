//
//  ConsentView.swift
//  Pregnancy mHealth
//
//  Created by Ben Cardy on 08/02/2022.
//

import SwiftUI

struct DrawExample: View {

    @Binding var hasDrawn: Bool
    @State private var points: [CGPoint] = []
    @State private var allPoints: [[CGPoint]] = []

    var body: some View {

        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(maxHeight: 300)
                .border(.black)
                .gesture(DragGesture().onChanged( { value in
                    self.addNewPoint(value)
                })
                .onEnded( { value in
                    hasDrawn = true
                    allPoints.append(points)
                    points = []
                }))
            DrawShape(currentPoints: points, allPoints: allPoints)
                .stroke(lineWidth: 5)
                .foregroundColor(.black)
                .clipped()
        }

    }

    private func addNewPoint(_ value: DragGesture.Value) {
        // here you can make some calculations based on previous points
        points.append(value.location)
    }

}

struct DrawShape: Shape {

    var currentPoints: [CGPoint]
    var allPoints: [[CGPoint]]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        var drawPoints = allPoints
        drawPoints.insert(currentPoints, at: 0)
        for points in drawPoints {
            if let firstPoint = points.first {
                path.move(to: firstPoint)
                for pointIndex in 1..<points.count {
                    path.addLine(to: points[pointIndex])
                }
            }
        }
        return path
    }
}

struct ConsentView: View {
    
    @Binding var showConsent: Bool
    @State var hasSigned = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Please sign using your finger in the box below.")
                
                CanvasView(hasDrawing: $hasSigned)
                    .frame(maxHeight: 200)
                
                Spacer()
                Button(action: {
                    showConsent = false
                }) {
                    Text("Done")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .disabled(!hasSigned)
                .buttonStyle(FilledButton())
            }
            .padding(20)
            .navigationTitle("Signature")
        }
    }
}

struct ConsentView_Previews: PreviewProvider {
    static var previews: some View {
        ConsentView(showConsent: .constant(true))
    }
}
