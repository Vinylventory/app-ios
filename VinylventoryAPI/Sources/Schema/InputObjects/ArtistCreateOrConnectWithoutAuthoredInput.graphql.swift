// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistCreateOrConnectWithoutAuthoredInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    create: ArtistCreateWithoutAuthoredInput,
    `where`: ArtistWhereUniqueInput
  ) {
    __data = InputDict([
      "create": create,
      "where": `where`
    ])
  }

  public var create: ArtistCreateWithoutAuthoredInput {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var `where`: ArtistWhereUniqueInput {
    get { __data["where"] }
    set { __data["where"] = newValue }
  }
}
