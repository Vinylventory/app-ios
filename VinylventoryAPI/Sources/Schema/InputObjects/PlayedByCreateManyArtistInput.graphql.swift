// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateManyArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idPlayedBy: GraphQLNullable<String> = nil,
    idVinyl: String
  ) {
    __data = InputDict([
      "idPlayedBy": idPlayedBy,
      "idVinyl": idVinyl
    ])
  }

  public var idPlayedBy: GraphQLNullable<String> {
    get { __data["idPlayedBy"] }
    set { __data["idPlayedBy"] = newValue }
  }

  public var idVinyl: String {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }
}
