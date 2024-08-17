// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateNestedManyWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[CreditWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[CreditCreateOrConnectWithoutVinylInput]> = nil,
    create: GraphQLNullable<[CreditCreateWithoutVinylInput]> = nil,
    createMany: GraphQLNullable<CreditCreateManyVinylInputEnvelope> = nil
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

  public var connectOrCreate: GraphQLNullable<[CreditCreateOrConnectWithoutVinylInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[CreditCreateWithoutVinylInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<CreditCreateManyVinylInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
