//
//  ShapeContainer.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//
import SwiftUI

/// Displays either the shape data if available, error message otherwise.
public struct ShapeContainer: View {
  @ObservedObject private var viewModel: ShapeViewModel
  private let networkUtility: NetworkUtility
  @State var didErrorOut: Bool = false
  
  public init(viewModel: ShapeViewModel, networkUtility: NetworkUtility) {
    self.viewModel = viewModel
    self.networkUtility = networkUtility
  }
  
  public var body: some View {
    NavigationView {
      if didErrorOut {
        Text("Something went wrong, please try again later.")
      } else {
        ShapeView(eventHandler: viewModel, drawnShapes: viewModel.drawnShapes, availableShapes: viewModel.data)
      }
    }.task {
      do {
        try await viewModel.refreshData()
        didErrorOut = false
      } catch {
        didErrorOut = true
      }
    }
  }
}
