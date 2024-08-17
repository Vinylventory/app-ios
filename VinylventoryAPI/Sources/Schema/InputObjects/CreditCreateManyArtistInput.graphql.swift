// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateManyArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idCredit: GraphQLNullable<String> = nil,
    idVinyl: String,
    note: GraphQLNullable<String> = nil,
    role: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "idCredit": idCredit,
      "idVinyl": idVinyl,
      "note": note,
      "role": role
    ])
  }

  public var idCredit: GraphQLNullable<String> {
    get { __data["idCredit"] }
    set { __data["idCredit"] = newValue }
  }

  public var idVinyl: String {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
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
