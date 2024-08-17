// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AlbumWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[AlbumWhereInput]> = nil,
    not: GraphQLNullable<[AlbumWhereInput]> = nil,
    or: GraphQLNullable<[AlbumWhereInput]> = nil,
    idAlbum: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idAlbum": idAlbum,
      "name": name,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[AlbumWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[AlbumWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[AlbumWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idAlbum: GraphQLNullable<String> {
    get { __data["idAlbum"] }
    set { __data["idAlbum"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var vinyls: GraphQLNullable<VinylListRelationFilter> {
    get { __data["vinyls"] }
    set { __data["vinyls"] = newValue }
  }
}
