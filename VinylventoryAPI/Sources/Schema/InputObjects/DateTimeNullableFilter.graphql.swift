// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct DateTimeNullableFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    equals: GraphQLNullable<DateTimeISO> = nil,
    gt: GraphQLNullable<DateTimeISO> = nil,
    gte: GraphQLNullable<DateTimeISO> = nil,
    `in`: GraphQLNullable<[DateTimeISO]> = nil,
    lt: GraphQLNullable<DateTimeISO> = nil,
    lte: GraphQLNullable<DateTimeISO> = nil,
    not: GraphQLNullable<NestedDateTimeNullableFilter> = nil,
    notIn: GraphQLNullable<[DateTimeISO]> = nil
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

  public var equals: GraphQLNullable<DateTimeISO> {
    get { __data["equals"] }
    set { __data["equals"] = newValue }
  }

  public var gt: GraphQLNullable<DateTimeISO> {
    get { __data["gt"] }
    set { __data["gt"] = newValue }
  }

  public var gte: GraphQLNullable<DateTimeISO> {
    get { __data["gte"] }
    set { __data["gte"] = newValue }
  }

  public var `in`: GraphQLNullable<[DateTimeISO]> {
    get { __data["in"] }
    set { __data["in"] = newValue }
  }

  public var lt: GraphQLNullable<DateTimeISO> {
    get { __data["lt"] }
    set { __data["lt"] = newValue }
  }

  public var lte: GraphQLNullable<DateTimeISO> {
    get { __data["lte"] }
    set { __data["lte"] = newValue }
  }

  public var not: GraphQLNullable<NestedDateTimeNullableFilter> {
    get { __data["not"] }
    set { __data["not"] = newValue }
  }

  public var notIn: GraphQLNullable<[DateTimeISO]> {
    get { __data["notIn"] }
    set { __data["notIn"] = newValue }
  }
}
