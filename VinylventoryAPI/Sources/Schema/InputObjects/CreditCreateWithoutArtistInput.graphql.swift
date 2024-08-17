// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateWithoutArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idCredit: GraphQLNullable<String> = nil,
    note: GraphQLNullable<String> = nil,
    role: GraphQLNullable<String> = nil,
    vinyl: VinylCreateNestedOneWithoutCreditsInput
  ) {
    __data = InputDict([
      "idCredit": idCredit,
      "note": note,
      "role": role,
      "vinyl": vinyl
    ])
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

  public var vinyl: VinylCreateNestedOneWithoutCreditsInput {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
