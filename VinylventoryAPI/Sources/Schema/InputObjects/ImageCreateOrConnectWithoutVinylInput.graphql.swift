// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageCreateOrConnectWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    create: ImageCreateWithoutVinylInput,
    `where`: ImageWhereUniqueInput
  ) {
    __data = InputDict([
      "create": create,
      "where": `where`
    ])
  }

  public var create: ImageCreateWithoutVinylInput {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var `where`: ImageWhereUniqueInput {
    get { __data["where"] }
    set { __data["where"] = newValue }
  }
}
