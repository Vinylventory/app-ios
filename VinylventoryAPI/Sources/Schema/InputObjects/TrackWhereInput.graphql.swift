// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct TrackWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[TrackWhereInput]> = nil,
    not: GraphQLNullable<[TrackWhereInput]> = nil,
    or: GraphQLNullable<[TrackWhereInput]> = nil,
    duration: GraphQLNullable<IntNullableFilter> = nil,
    idTrack: GraphQLNullable<StringFilter> = nil,
    idVinyl: GraphQLNullable<StringFilter> = nil,
    name: GraphQLNullable<StringFilter> = nil,
    vinyl: GraphQLNullable<VinylRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "duration": duration,
      "idTrack": idTrack,
      "idVinyl": idVinyl,
      "name": name,
      "vinyl": vinyl
    ])
  }

  public var and: GraphQLNullable<[TrackWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[TrackWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[TrackWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var duration: GraphQLNullable<IntNullableFilter> {
    get { __data["duration"] }
    set { __data["duration"] = newValue }
  }

  public var idTrack: GraphQLNullable<StringFilter> {
    get { __data["idTrack"] }
    set { __data["idTrack"] = newValue }
  }

  public var idVinyl: GraphQLNullable<StringFilter> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var name: GraphQLNullable<StringFilter> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var vinyl: GraphQLNullable<VinylRelationFilter> {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
