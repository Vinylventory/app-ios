// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    artist: ArtistCreateNestedOneWithoutPlayedByInput,
    idPlayedBy: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "artist": artist,
      "idPlayedBy": idPlayedBy
    ])
  }

  public var artist: ArtistCreateNestedOneWithoutPlayedByInput {
    get { __data["artist"] }
    set { __data["artist"] = newValue }
  }

  public var idPlayedBy: GraphQLNullable<String> {
    get { __data["idPlayedBy"] }
    set { __data["idPlayedBy"] = newValue }
  }
}
