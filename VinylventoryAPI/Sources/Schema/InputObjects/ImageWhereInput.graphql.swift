// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[ImageWhereInput]> = nil,
    not: GraphQLNullable<[ImageWhereInput]> = nil,
    or: GraphQLNullable<[ImageWhereInput]> = nil,
    idImage: GraphQLNullable<StringFilter> = nil,
    idVinyl: GraphQLNullable<StringFilter> = nil,
    path: GraphQLNullable<StringFilter> = nil,
    vinyl: GraphQLNullable<VinylRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idImage": idImage,
      "idVinyl": idVinyl,
      "path": path,
      "vinyl": vinyl
    ])
  }

  public var and: GraphQLNullable<[ImageWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[ImageWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[ImageWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idImage: GraphQLNullable<StringFilter> {
    get { __data["idImage"] }
    set { __data["idImage"] = newValue }
  }

  public var idVinyl: GraphQLNullable<StringFilter> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var path: GraphQLNullable<StringFilter> {
    get { __data["path"] }
    set { __data["path"] = newValue }
  }

  public var vinyl: GraphQLNullable<VinylRelationFilter> {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
