// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[ArtistWhereInput]> = nil,
    not: GraphQLNullable<[ArtistWhereInput]> = nil,
    or: GraphQLNullable<[ArtistWhereInput]> = nil,
    authored: GraphQLNullable<AuthoredListRelationFilter> = nil,
    credits: GraphQLNullable<CreditListRelationFilter> = nil,
    idArtist: GraphQLNullable<StringFilter> = nil,
    name: GraphQLNullable<StringFilter> = nil,
    origin: GraphQLNullable<StringFilter> = nil,
    playedBy: GraphQLNullable<PlayedByListRelationFilter> = nil,
    surname: GraphQLNullable<StringNullableFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "authored": authored,
      "credits": credits,
      "idArtist": idArtist,
      "name": name,
      "origin": origin,
      "playedBy": playedBy,
      "surname": surname
    ])
  }

  public var and: GraphQLNullable<[ArtistWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[ArtistWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[ArtistWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var authored: GraphQLNullable<AuthoredListRelationFilter> {
    get { __data["authored"] }
    set { __data["authored"] = newValue }
  }

  public var credits: GraphQLNullable<CreditListRelationFilter> {
    get { __data["credits"] }
    set { __data["credits"] = newValue }
  }

  public var idArtist: GraphQLNullable<StringFilter> {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var name: GraphQLNullable<StringFilter> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var origin: GraphQLNullable<StringFilter> {
    get { __data["origin"] }
    set { __data["origin"] = newValue }
  }

  public var playedBy: GraphQLNullable<PlayedByListRelationFilter> {
    get { __data["playedBy"] }
    set { __data["playedBy"] = newValue }
  }

  public var surname: GraphQLNullable<StringNullableFilter> {
    get { __data["surname"] }
    set { __data["surname"] = newValue }
  }
}
