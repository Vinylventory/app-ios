// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[PlayedByWhereInput]> = nil,
    not: GraphQLNullable<[PlayedByWhereInput]> = nil,
    or: GraphQLNullable<[PlayedByWhereInput]> = nil,
    artist: GraphQLNullable<ArtistRelationFilter> = nil,
    idArtist: GraphQLNullable<StringFilter> = nil,
    idartistIdvinyl: GraphQLNullable<PlayedByIdArtistIdVinylCompoundUniqueInput> = nil,
    idPlayedBy: GraphQLNullable<String> = nil,
    idVinyl: GraphQLNullable<StringFilter> = nil,
    vinyl: GraphQLNullable<VinylRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "artist": artist,
      "idArtist": idArtist,
      "idArtist_idVinyl": idartistIdvinyl,
      "idPlayedBy": idPlayedBy,
      "idVinyl": idVinyl,
      "vinyl": vinyl
    ])
  }

  public var and: GraphQLNullable<[PlayedByWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[PlayedByWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[PlayedByWhereInput]> {
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

  public var idartistIdvinyl: GraphQLNullable<PlayedByIdArtistIdVinylCompoundUniqueInput> {
    get { __data["idArtist_idVinyl"] }
    set { __data["idArtist_idVinyl"] = newValue }
  }

  public var idPlayedBy: GraphQLNullable<String> {
    get { __data["idPlayedBy"] }
    set { __data["idPlayedBy"] = newValue }
  }

  public var idVinyl: GraphQLNullable<StringFilter> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var vinyl: GraphQLNullable<VinylRelationFilter> {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
