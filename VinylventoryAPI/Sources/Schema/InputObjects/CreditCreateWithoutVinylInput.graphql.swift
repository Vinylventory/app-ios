// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    artist: ArtistCreateNestedOneWithoutCreditsInput,
    idCredit: GraphQLNullable<String> = nil,
    note: GraphQLNullable<String> = nil,
    role: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "artist": artist,
      "idCredit": idCredit,
      "note": note,
      "role": role
    ])
  }

  public var artist: ArtistCreateNestedOneWithoutCreditsInput {
    get { __data["artist"] }
    set { __data["artist"] = newValue }
  }

  public var idCredit: GraphQLNullable<String> {
    get { __data["idCredit"] }
    set { __data["idCredit"] = newValue }
  }

  public var note: GraphQLNullable<String> {
    get { __data["note"] }
    set { __data["note"] = newValue }
  }

  public var role: GraphQLNullable<String> {
    get { __data["role"] }
    set { __data["role"] = newValue }
  }
}
