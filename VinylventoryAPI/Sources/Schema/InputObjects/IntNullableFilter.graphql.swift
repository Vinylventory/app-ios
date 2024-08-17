// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct IntNullableFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    equals: GraphQLNullable<Int> = nil,
    gt: GraphQLNullable<Int> = nil,
    gte: GraphQLNullable<Int> = nil,
    `in`: GraphQLNullable<[Int]> = nil,
    lt: GraphQLNullable<Int> = nil,
    lte: GraphQLNullable<Int> = nil,
    not: GraphQLNullable<NestedIntNullableFilter> = nil,
    notIn: GraphQLNullable<[Int]> = nil
  ) {
    __data = InputDict([
      "equals": equals,
      "gt": gt,
      "gte": gte,
      "in": `in`,
      "lt": lt,
      "lte": lte,
      "not": not,
      "notIn": notIn
    ])
  }

  public var equals: GraphQLNullable<Int> {
    get { __data["equals"] }
    set { __data["equals"] = newValue }
  }

  public var gt: GraphQLNullable<Int> {
    get { __data["gt"] }
    set { __data["gt"] = newValue }
  }

  public var gte: GraphQLNullable<Int> {
    get { __data["gte"] }
    set { __data["gte"] = newValue }
  }

  public var `in`: GraphQLNullable<[Int]> {
    get { __data["in"] }
    set { __data["in"] = newValue }
  }

  public var lt: GraphQLNullable<Int> {
    get { __data["lt"] }
    set { __data["lt"] = newValue }
  }

  public var lte: GraphQLNullable<Int> {
    get { __data["lte"] }
    set { __data["lte"] = newValue }
  }

  public var not: GraphQLNullable<NestedIntNullableFilter> {
    get { __data["not"] }
    set { __data["not"] = newValue }
  }

  public var notIn: GraphQLNullable<[Int]> {
    get { __data["notIn"] }
    set { __data["notIn"] = newValue }
  }
}
