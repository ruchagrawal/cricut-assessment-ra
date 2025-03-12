//
//  CustomShape.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//
import SwiftUI

/// Creates a custom shape for a given type
public struct CustomShape: View, Identifiable {
  public let id: UUID = UUID()
  public let type: ShapeType
  private let shapeHeight: Double = 50
  private let shapeWidth: Double = 50
  
  public init(type: ShapeType) {
    self.type = type
  }
  
  public var body: some View {
    shapeView()
  }
  
  @ViewBuilder private func shapeView() -> some View {
    switch type {
      case .circle:
        Circle()
          .fill(Color.blue)
          .frame(width: shapeWidth, height: shapeHeight)
      case .square:
        Rectangle()
          .fill(Color.blue)
          .frame(width: shapeWidth, height: shapeHeight)
      case .triangle:
        Triangle()
          .fill(Color.blue)
          .frame(width: shapeWidth, height: shapeHeight)
    }
  }
}
