
//
//  ShapeData.swift
//  CricutAssessment
//
//  Created by Ruchi Agrawal on 3/10/25.
//

public struct ShapeData: Decodable, Hashable {
  public let name: String
  public let type: ShapeType
  public let drawPath: String
  
  public enum CodingKeys: String, CodingKey {
    case name = "name"
    case drawPath = "draw_path"
  }
  
  public init(from decoder: any Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.drawPath = try values.decodeIfPresent(String.self, forKey: .drawPath) ?? ""
    self.type = ShapeType(rawValue: name) ?? .circle
  }
}

public enum ShapeType: String {
  case circle = "Circle"
  case square = "Square"
  case triangle = "Triangle"
}
