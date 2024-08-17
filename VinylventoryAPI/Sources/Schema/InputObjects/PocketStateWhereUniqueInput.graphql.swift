// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PocketStateWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[PocketStateWhereInput]> = nil,
    not: GraphQLNullable<[PocketStateWhereInput]> = nil,
    or: GraphQLNullable<[PocketStateWhereInput]> = nil,
    idPocketState: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idPocketState": idPocketState,
      "name": name,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[PocketStateWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[PocketStateWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[PocketStateWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idPocketState: GraphQLNullable<String> {
    get { __data["idPocketState"] }
    set { __data["idPocketState"] = newValue }
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
