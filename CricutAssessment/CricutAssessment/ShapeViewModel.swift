//
//  ShapeViewModel.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//
import Combine
import Foundation

public class ShapeViewModel: ObservableObject {
  @Published public private(set) var data: [ShapeData] = []
  @Published public private(set) var drawnShapes: [CustomShape] = []
  
  private let networkUtility: NetworkUtility
  private let shapeURL = URL(string: "https://staticcontent.cricut.com/static/test/shapes_001.json")
  
  public init(networkUtility: NetworkUtility) {
    self.networkUtility = networkUtility
  }
  
  public func refreshData() async throws {
    guard let shapeURL else {
      return
    }
    
    let data = try await  networkUtility.downloadData(for: shapeURL, canReturnCachedData: true)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    guard let decodedData = try decoder.decode([String: [ShapeData]].self, from: data).values.first else {
      return
    }
    
    await MainActor.run {[weak self] in
      self?.data = decodedData
    }
  }
}

extension ShapeViewModel: EditShapeEventHandler {
  public func addShape(type: ShapeType) {
    drawnShapes.append(CustomShape(type: type))
  }
  
  public func removeLastShape(type: ShapeType) {
    if let lastIndex = drawnShapes.lastIndex(where: { $0.type == type }) {
      drawnShapes.remove(at: lastIndex)
    }
  }
  
  public func removeAllShapes(type: ShapeType) {
    drawnShapes.removeAll { $0.type == type }
  }
}
extension ShapeViewModel: ShapeViewEventHandler {
  public func removeAllShapes() {
    drawnShapes.removeAll()
  }
}

/// Common protocol to add a type of shape. This is used by both the edit circles view and the main view.
public protocol AddShapeEventHandler {
  func addShape(type: ShapeType)
}

/// Event handler for the shape view
public protocol ShapeViewEventHandler: AddShapeEventHandler {
  func removeAllShapes()
}

/// Event handler for edit shape view.
public protocol EditShapeEventHandler: AddShapeEventHandler {
  func removeLastShape(type: ShapeType)
  func removeAllShapes(type: ShapeType)
}
