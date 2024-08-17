// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    `is`: GraphQLNullable<ArtistWhereInput> = nil,
    isNot: GraphQLNullable<ArtistWhereInput> = nil
  ) {
    __data = InputDict([
      "is": `is`,
      "isNot": isNot
    ])
  }

  public var `is`: GraphQLNullable<ArtistWhereInput> {
    get { __data["is"] }
    set { __data["is"] = newValue }
  }

  public var isNot: GraphQLNullable<ArtistWhereInput> {
    get { __data["isNot"] }
    set { __data["isNot"] = newValue }
  }
}
