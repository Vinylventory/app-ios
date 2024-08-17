// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<AuthoredWhereInput> = nil,
    none: GraphQLNullable<AuthoredWhereInput> = nil,
    some: GraphQLNullable<AuthoredWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "none": none,
      "some": some
    ])
  }

  public var every: GraphQLNullable<AuthoredWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var none: GraphQLNullable<AuthoredWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }

  public var some: GraphQLNullable<AuthoredWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }
}
