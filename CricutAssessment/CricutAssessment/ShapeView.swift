//
//  ShapeView.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/11/25.
//

import SwiftUI

/// Shows the drawn shapes and the ability to add different types of shapes.
public struct ShapeView: View {
  private let eventHandler: ShapeViewEventHandler & EditShapeEventHandler
  private let drawnShapes: [CustomShape]
  private let availableShapes: [ShapeData]
  
  public init(
    eventHandler: (ShapeViewEventHandler & EditShapeEventHandler),
    drawnShapes: [CustomShape],
    availableShapes: [ShapeData]) {
      self.eventHandler = eventHandler
      self.drawnShapes = drawnShapes
      self.availableShapes = availableShapes
    }
  
  public var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 50))]) {
        ForEach(drawnShapes, id: \.id) { shape in
          shape
        }
      }
    }
    .padding()
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button("Clear All") {
          eventHandler.removeAllShapes()
        }
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        NavigationLink(destination: EditShapeView(shapes: drawnShapes, eventHandler: eventHandler, editType: .circle)) {
          Text("Edit Circle")
        }
      }
      
      ToolbarItemGroup(placement: .bottomBar) {
        HStack {
          ForEach(availableShapes, id: \.self) { available in
            Button(available.name) {
              eventHandler.addShape(type: available.type)
            }
          }
        }
      }
    }
  }
}
