// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredIdArtistIdVinylCompoundUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idArtist: String,
    idVinyl: String
  ) {
    __data = InputDict([
      "idArtist": idArtist,
      "idVinyl": idVinyl
    ])
  }

  public var idArtist: String {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var idVinyl: String {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }
}
