// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct LabelWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[LabelWhereInput]> = nil,
    not: GraphQLNullable<[LabelWhereInput]> = nil,
    or: GraphQLNullable<[LabelWhereInput]> = nil,
    idLabel: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idLabel": idLabel,
      "name": name,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[LabelWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[LabelWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[LabelWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idLabel: GraphQLNullable<String> {
    get { __data["idLabel"] }
    set { __data["idLabel"] = newValue }
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
