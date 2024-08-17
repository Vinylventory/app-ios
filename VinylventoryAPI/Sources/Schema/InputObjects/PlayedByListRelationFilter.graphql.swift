// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<PlayedByWhereInput> = nil,
    none: GraphQLNullable<PlayedByWhereInput> = nil,
    some: GraphQLNullable<PlayedByWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "none": none,
      "some": some
    ])
  }

  public var every: GraphQLNullable<PlayedByWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var none: GraphQLNullable<PlayedByWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }

  public var some: GraphQLNullable<PlayedByWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }
}
