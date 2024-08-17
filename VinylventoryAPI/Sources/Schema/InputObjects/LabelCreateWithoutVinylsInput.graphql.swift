// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct LabelCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idLabel: GraphQLNullable<String> = nil,
    name: String
  ) {
    __data = InputDict([
      "idLabel": idLabel,
      "name": name
    ])
  }

  public var idLabel: GraphQLNullable<String> {
    get { __data["idLabel"] }
    set { __data["idLabel"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
