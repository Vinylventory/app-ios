// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct TrackListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<TrackWhereInput> = nil,
    none: GraphQLNullable<TrackWhereInput> = nil,
    some: GraphQLNullable<TrackWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "none": none,
      "some": some
    ])
  }

  public var every: GraphQLNullable<TrackWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var none: GraphQLNullable<TrackWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }

  public var some: GraphQLNullable<TrackWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }
}
