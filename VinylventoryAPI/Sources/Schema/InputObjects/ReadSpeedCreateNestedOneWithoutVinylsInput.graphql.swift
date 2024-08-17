// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ReadSpeedCreateNestedOneWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<ReadSpeedWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<ReadSpeedCreateOrConnectWithoutVinylsInput> = nil,
    create: GraphQLNullable<ReadSpeedCreateWithoutVinylsInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<ReadSpeedWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<ReadSpeedCreateOrConnectWithoutVinylsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<ReadSpeedCreateWithoutVinylsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
