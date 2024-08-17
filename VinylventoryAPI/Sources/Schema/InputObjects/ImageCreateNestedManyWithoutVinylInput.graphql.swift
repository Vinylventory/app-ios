// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageCreateNestedManyWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[ImageWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[ImageCreateOrConnectWithoutVinylInput]> = nil,
    create: GraphQLNullable<[ImageCreateWithoutVinylInput]> = nil,
    createMany: GraphQLNullable<ImageCreateManyVinylInputEnvelope> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create,
      "createMany": createMany
    ])
  }

  public var connect: GraphQLNullable<[ImageWhereUniqueInput]> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<[ImageCreateOrConnectWithoutVinylInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[ImageCreateWithoutVinylInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<ImageCreateManyVinylInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
