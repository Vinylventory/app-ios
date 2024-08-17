// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredCreateManyArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idAuthored: GraphQLNullable<String> = nil,
    idVinyl: String
  ) {
    __data = InputDict([
      "idAuthored": idAuthored,
      "idVinyl": idVinyl
    ])
  }

  public var idAuthored: GraphQLNullable<String> {
    get { __data["idAuthored"] }
    set { __data["idAuthored"] = newValue }
  }

  public var idVinyl: String {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }
}
