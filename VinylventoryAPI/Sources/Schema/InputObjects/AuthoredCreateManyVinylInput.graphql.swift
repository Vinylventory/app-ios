// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredCreateManyVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idArtist: String,
    idAuthored: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "idArtist": idArtist,
      "idAuthored": idAuthored
    ])
  }

  public var idArtist: String {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var idAuthored: GraphQLNullable<String> {
    get { __data["idAuthored"] }
    set { __data["idAuthored"] = newValue }
  }
}
