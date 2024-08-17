// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ReadSpeedWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[ReadSpeedWhereInput]> = nil,
    not: GraphQLNullable<[ReadSpeedWhereInput]> = nil,
    or: GraphQLNullable<[ReadSpeedWhereInput]> = nil,
    idReadSpeed: GraphQLNullable<String> = nil,
    speed: GraphQLNullable<String> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "idReadSpeed": idReadSpeed,
      "speed": speed,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[ReadSpeedWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[ReadSpeedWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[ReadSpeedWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var idReadSpeed: GraphQLNullable<String> {
    get { __data["idReadSpeed"] }
    set { __data["idReadSpeed"] = newValue }
  }

  public var speed: GraphQLNullable<String> {
    get { __data["speed"] }
    set { __data["speed"] = newValue }
  }

  public var vinyls: GraphQLNullable<VinylListRelationFilter> {
    get { __data["vinyls"] }
    set { __data["vinyls"] = newValue }
  }
}
