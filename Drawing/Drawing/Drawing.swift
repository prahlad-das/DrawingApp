//
//  Drawing.swift
//  Drawing
//
//  Created by Prahlad Das on 4/19/25.
//
import SwiftUI

struct Drawing: Identifiable {
    var id = UUID()
    var points: [CGPoint] = []
    var color: Color = .black
    var lineWidth: CGFloat = 1.0
}
