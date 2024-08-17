// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateNestedManyWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[PlayedByWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[PlayedByCreateOrConnectWithoutVinylInput]> = nil,
    create: GraphQLNullable<[PlayedByCreateWithoutVinylInput]> = nil,
    createMany: GraphQLNullable<PlayedByCreateManyVinylInputEnvelope> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create,
      "createMany": createMany
    ])
  }

  public var connect: GraphQLNullable<[PlayedByWhereUniqueInput]> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<[PlayedByCreateOrConnectWithoutVinylInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[PlayedByCreateWithoutVinylInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<PlayedByCreateManyVinylInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
