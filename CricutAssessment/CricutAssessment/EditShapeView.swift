//
//  EditCirclesView.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//

import SwiftUI

/// View that adds or removes a shape type
public struct EditShapeView: View {
  private var shapes: [CustomShape]
  private let eventHandler: EditShapeEventHandler
  private let editType: ShapeType
  
  public init(shapes:[CustomShape],
              eventHandler: EditShapeEventHandler,
              editType: ShapeType) {
    self.shapes = shapes
    self.editType = editType
    self.eventHandler = eventHandler
  }
  
  public var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [.init(.adaptive(minimum: 50, maximum: 50))]) {
          ForEach(shapes, id: \.id) { shape in
            if shape.type == editType {
              shape
            }
          }
        }
      }
      Spacer()
      HStack {
        Button("Delete all") {
          eventHandler.removeAllShapes(type: editType)
        }
        Spacer()
        Button("Add") {
          eventHandler.addShape(type: editType)
        }
        Spacer()
        Button("Remove") {
          eventHandler.removeLastShape(type: editType)
        }
      }
    }.padding()
  }
}
