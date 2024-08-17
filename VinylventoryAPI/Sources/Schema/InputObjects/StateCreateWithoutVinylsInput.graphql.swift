// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct StateCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idState: GraphQLNullable<String> = nil,
    name: String
  ) {
    __data = InputDict([
      "idState": idState,
      "name": name
    ])
  }

  public var idState: GraphQLNullable<String> {
    get { __data["idState"] }
    set { __data["idState"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
