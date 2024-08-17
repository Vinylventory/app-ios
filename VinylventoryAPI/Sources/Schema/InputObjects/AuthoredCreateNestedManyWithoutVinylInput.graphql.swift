// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredCreateNestedManyWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[AuthoredWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[AuthoredCreateOrConnectWithoutVinylInput]> = nil,
    create: GraphQLNullable<[AuthoredCreateWithoutVinylInput]> = nil,
    createMany: GraphQLNullable<AuthoredCreateManyVinylInputEnvelope> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create,
      "createMany": createMany
    ])
  }

  public var connect: GraphQLNullable<[AuthoredWhereUniqueInput]> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<[AuthoredCreateOrConnectWithoutVinylInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[AuthoredCreateWithoutVinylInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<AuthoredCreateManyVinylInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
