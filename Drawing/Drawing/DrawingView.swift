//
//  DrawingView.swift
//  Drawing
//
//  Created by Prahlad Das on 4/19/25.
//
import SwiftUI

struct DrawingView: View {
    var width: CGFloat
    var height: CGFloat

    @State private var currentDrawing = Drawing()
    @State private var drawings = [Drawing]()
    @State private var color = Color.black
    @State private var lineWidth: CGFloat = 5

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: width, height: height)
                    .border(Color.gray)

                DrawingCanvas(currentDrawing: $currentDrawing, drawings: $drawings, color: color, lineWidth: lineWidth)
                    .frame(width: width, height: height)
            }

            HStack {
                ColorPicker("Brush Color", selection: $color)
                    .frame(maxWidth: 150)

                Text("Size")
                Slider(value: $lineWidth, in: 1...30)
                Text("\(Int(lineWidth))")
            }
            .padding()

            Button("Clear Canvas") {
                drawings.removeAll()
            }
            .foregroundColor(.red)
            .padding(.bottom)
        }
        .navigationTitle("Draw")
        .navigationBarTitleDisplayMode(.inline)
    }
}
