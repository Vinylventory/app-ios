// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateManyVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idArtist: String,
    idCredit: GraphQLNullable<String> = nil,
    note: GraphQLNullable<String> = nil,
    role: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "idArtist": idArtist,
      "idCredit": idCredit,
      "note": note,
      "role": role
    ])
  }

  public var idArtist: String {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
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
