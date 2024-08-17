// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PocketStateCreateNestedOneWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<PocketStateWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<PocketStateCreateOrConnectWithoutVinylsInput> = nil,
    create: GraphQLNullable<PocketStateCreateWithoutVinylsInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<PocketStateWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<PocketStateCreateOrConnectWithoutVinylsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<PocketStateCreateWithoutVinylsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
