// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct TrackCreateManyVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    duration: GraphQLNullable<Int> = nil,
    idTrack: GraphQLNullable<String> = nil,
    name: String
  ) {
    __data = InputDict([
      "duration": duration,
      "idTrack": idTrack,
      "name": name
    ])
  }

  public var duration: GraphQLNullable<Int> {
    get { __data["duration"] }
    set { __data["duration"] = newValue }
  }

  public var idTrack: GraphQLNullable<String> {
    get { __data["idTrack"] }
    set { __data["idTrack"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
