// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<CreditWhereInput> = nil,
    none: GraphQLNullable<CreditWhereInput> = nil,
    some: GraphQLNullable<CreditWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "none": none,
      "some": some
    ])
  }

  public var every: GraphQLNullable<CreditWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var none: GraphQLNullable<CreditWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }

  public var some: GraphQLNullable<CreditWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }
}
