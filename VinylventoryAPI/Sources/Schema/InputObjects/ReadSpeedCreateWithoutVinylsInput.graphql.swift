// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ReadSpeedCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idReadSpeed: GraphQLNullable<String> = nil,
    speed: String
  ) {
    __data = InputDict([
      "idReadSpeed": idReadSpeed,
      "speed": speed
    ])
  }

  public var idReadSpeed: GraphQLNullable<String> {
    get { __data["idReadSpeed"] }
    set { __data["idReadSpeed"] = newValue }
  }

  public var speed: String {
    get { __data["speed"] }
    set { __data["speed"] = newValue }
  }
}
