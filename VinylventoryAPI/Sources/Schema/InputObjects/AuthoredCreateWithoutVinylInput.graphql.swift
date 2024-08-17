// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredCreateWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    artist: ArtistCreateNestedOneWithoutAuthoredInput,
    idAuthored: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "artist": artist,
      "idAuthored": idAuthored
    ])
  }

  public var artist: ArtistCreateNestedOneWithoutAuthoredInput {
    get { __data["artist"] }
    set { __data["artist"] = newValue }
  }

  public var idAuthored: GraphQLNullable<String> {
    get { __data["idAuthored"] }
    set { __data["idAuthored"] = newValue }
  }
}
