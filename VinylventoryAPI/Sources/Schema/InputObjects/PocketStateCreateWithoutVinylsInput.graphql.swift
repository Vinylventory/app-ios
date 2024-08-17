// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PocketStateCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idPocketState: GraphQLNullable<String> = nil,
    name: String
  ) {
    __data = InputDict([
      "idPocketState": idPocketState,
      "name": name
    ])
  }

  public var idPocketState: GraphQLNullable<String> {
    get { __data["idPocketState"] }
    set { __data["idPocketState"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
