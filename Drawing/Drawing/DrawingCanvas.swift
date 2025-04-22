//
//  DrawingCanvas.swift
//  Drawing
//
//  Created by Prahlad Das on 4/19/25.
//
import SwiftUI

struct DrawingCanvas: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    var color: Color
    var lineWidth: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(drawings) { drawing in
                    Path { path in
                        for (i, point) in drawing.points.enumerated() {
                            if i == 0 {
                                path.move(to: point)
                            } else {
                                path.addLine(to: point)
                            }
                        }
                    }
                    .stroke(drawing.color, lineWidth: drawing.lineWidth)
                }

                Path { path in
                    for (i, point) in currentDrawing.points.enumerated() {
                        if i == 0 {
                            path.move(to: point)
                        } else {
                            path.addLine(to: point)
                        }
                    }
                }
                .stroke(color, lineWidth: lineWidth)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            currentDrawing.points.append(value.location)
                        }
                        .onEnded { _ in
                            var newDrawing = currentDrawing
                            newDrawing.color = color
                            newDrawing.lineWidth = lineWidth
                            drawings.append(newDrawing)
                            currentDrawing = Drawing()
                        }
                )
            }
        }
    }
}
