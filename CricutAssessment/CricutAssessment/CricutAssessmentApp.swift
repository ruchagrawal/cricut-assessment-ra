//
//  CricutAssessmentApp.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//

import SwiftUI

@main
struct CricutAssessmentApp: App {
  private let networkUtility: NetworkUtility = NetworkUtility()
  
  var body: some Scene {
    WindowGroup {
      ShapeViewFactory().makeShapeView()
    }
  }
}
