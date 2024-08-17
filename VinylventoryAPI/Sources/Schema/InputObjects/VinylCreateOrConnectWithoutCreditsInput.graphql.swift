// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct VinylCreateOrConnectWithoutCreditsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    create: VinylCreateWithoutCreditsInput,
    `where`: VinylWhereUniqueInput
  ) {
    __data = InputDict([
      "create": create,
      "where": `where`
    ])
  }

  public var create: VinylCreateWithoutCreditsInput {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var `where`: VinylWhereUniqueInput {
    get { __data["where"] }
    set { __data["where"] = newValue }
  }
}
