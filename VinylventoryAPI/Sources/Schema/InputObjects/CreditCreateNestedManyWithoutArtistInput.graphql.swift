// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateNestedManyWithoutArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[CreditWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[CreditCreateOrConnectWithoutArtistInput]> = nil,
    create: GraphQLNullable<[CreditCreateWithoutArtistInput]> = nil,
    createMany: GraphQLNullable<CreditCreateManyArtistInputEnvelope> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create,
      "createMany": createMany
    ])
  }

  public var connect: GraphQLNullable<[CreditWhereUniqueInput]> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<[CreditCreateOrConnectWithoutArtistInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[CreditCreateWithoutArtistInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<CreditCreateManyArtistInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
