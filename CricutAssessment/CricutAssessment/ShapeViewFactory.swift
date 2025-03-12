//
//  ShapeViewFactory.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/11/25.
//
import SwiftUI

/// Creates and returns a `ShapeContainer` view.
public struct ShapeViewFactory {
  public func makeShapeView() -> some View {
    let networkUtility = NetworkUtility()
    let shapeViewModel = ShapeViewModel(networkUtility: networkUtility)
    return ShapeContainer(viewModel: shapeViewModel, networkUtility: networkUtility)
  }
}
