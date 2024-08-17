// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<ImageWhereInput> = nil,
    none: GraphQLNullable<ImageWhereInput> = nil,
    some: GraphQLNullable<ImageWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "none": none,
      "some": some
    ])
  }

  public var every: GraphQLNullable<ImageWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var none: GraphQLNullable<ImageWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }

  public var some: GraphQLNullable<ImageWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }
}
