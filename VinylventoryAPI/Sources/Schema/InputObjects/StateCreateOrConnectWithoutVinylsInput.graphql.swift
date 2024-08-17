// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct StateCreateOrConnectWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    create: StateCreateWithoutVinylsInput,
    `where`: StateWhereUniqueInput
  ) {
    __data = InputDict([
      "create": create,
      "where": `where`
    ])
  }

  public var create: StateCreateWithoutVinylsInput {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var `where`: StateWhereUniqueInput {
    get { __data["where"] }
    set { __data["where"] = newValue }
  }
}
