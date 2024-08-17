// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AlbumNullableRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    `is`: GraphQLNullable<AlbumWhereInput> = nil,
    isNot: GraphQLNullable<AlbumWhereInput> = nil
  ) {
    __data = InputDict([
      "is": `is`,
      "isNot": isNot
    ])
  }

  public var `is`: GraphQLNullable<AlbumWhereInput> {
    get { __data["is"] }
    set { __data["is"] = newValue }
  }

  public var isNot: GraphQLNullable<AlbumWhereInput> {
    get { __data["isNot"] }
    set { __data["isNot"] = newValue }
  }
}
