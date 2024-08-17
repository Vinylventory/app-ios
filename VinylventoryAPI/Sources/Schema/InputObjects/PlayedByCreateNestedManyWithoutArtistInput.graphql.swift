// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateNestedManyWithoutArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[PlayedByWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[PlayedByCreateOrConnectWithoutArtistInput]> = nil,
    create: GraphQLNullable<[PlayedByCreateWithoutArtistInput]> = nil,
    createMany: GraphQLNullable<PlayedByCreateManyArtistInputEnvelope> = nil
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

  public var connectOrCreate: GraphQLNullable<[PlayedByCreateOrConnectWithoutArtistInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[PlayedByCreateWithoutArtistInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<PlayedByCreateManyArtistInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
