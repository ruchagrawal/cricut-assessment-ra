//
//  Triangle.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//

import SwiftUI

/// Creates a triangle in a given frame.
public struct Triangle: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    return path
  }
}
