// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct StateWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[StateWhereInput]> = nil,
    not: GraphQLNullable<[StateWhereInput]> = nil,
    or: GraphQLNullable<[StateWhereInput]> = nil,
    idState: GraphQLNullable<StringFilter> = nil,
    name: GraphQLNullable<StringFilter> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idState": idState,
      "name": name,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[StateWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[StateWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[StateWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idState: GraphQLNullable<StringFilter> {
    get { __data["idState"] }
    set { __data["idState"] = newValue }
  }

  public var name: GraphQLNullable<StringFilter> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var vinyls: GraphQLNullable<VinylListRelationFilter> {
    get { __data["vinyls"] }
    set { __data["vinyls"] = newValue }
  }
}
