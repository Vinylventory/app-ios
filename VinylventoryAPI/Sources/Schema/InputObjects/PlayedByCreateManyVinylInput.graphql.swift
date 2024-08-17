// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateManyVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idArtist: String,
    idPlayedBy: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "idArtist": idArtist,
      "idPlayedBy": idPlayedBy
    ])
  }

  public var idArtist: String {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var idPlayedBy: GraphQLNullable<String> {
    get { __data["idPlayedBy"] }
    set { __data["idPlayedBy"] = newValue }
  }
}
