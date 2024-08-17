// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[CreditWhereInput]> = nil,
    not: GraphQLNullable<[CreditWhereInput]> = nil,
    or: GraphQLNullable<[CreditWhereInput]> = nil,
    artist: GraphQLNullable<ArtistRelationFilter> = nil,
    idArtist: GraphQLNullable<StringFilter> = nil,
    idCredit: GraphQLNullable<String> = nil,
    idVinyl: GraphQLNullable<StringFilter> = nil,
    note: GraphQLNullable<StringNullableFilter> = nil,
    role: GraphQLNullable<StringNullableFilter> = nil,
    vinyl: GraphQLNullable<VinylRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "artist": artist,
      "idArtist": idArtist,
      "idCredit": idCredit,
      "idVinyl": idVinyl,
      "note": note,
      "role": role,
      "vinyl": vinyl
    ])
  }

  public var and: GraphQLNullable<[CreditWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[CreditWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[CreditWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var artist: GraphQLNullable<ArtistRelationFilter> {
    get { __data["artist"] }
    set { __data["artist"] = newValue }
  }

  public var idArtist: GraphQLNullable<StringFilter> {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var idCredit: GraphQLNullable<String> {
    get { __data["idCredit"] }
    set { __data["idCredit"] = newValue }
  }

  public var idVinyl: GraphQLNullable<StringFilter> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var note: GraphQLNullable<StringNullableFilter> {
    get { __data["note"] }
    set { __data["note"] = newValue }
  }

  public var role: GraphQLNullable<StringNullableFilter> {
    get { __data["role"] }
    set { __data["role"] = newValue }
  }

  public var vinyl: GraphQLNullable<VinylRelationFilter> {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
