//
//  SimpleCanvasView.swift
//  Pregnancy mHealth
//
//  Created by Majd Koshakji on 10/2/22.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var hasDrawing: Bool
    func makeCoordinator() -> Coordinator {
        return Coordinator { drawing in
            self.hasDrawing = !drawing.strokes.isEmpty
        }
    }
    
    func makeUIView(context: Context) -> some UIView {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        canvas.isRulerActive = false
        canvas.tool = PKInkingTool(.pen)
        canvas.delegate = context.coordinator
        return canvas
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        let onDrawingChanged: (PKDrawing) -> Void
        
        init(onDrawingChanged: @escaping (PKDrawing) -> Void) {
            self.onDrawingChanged = onDrawingChanged
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            self.onDrawingChanged(canvasView.drawing)
        }
    }
}
