// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct StateCreateNestedOneWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<StateWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<StateCreateOrConnectWithoutVinylsInput> = nil,
    create: GraphQLNullable<StateCreateWithoutVinylsInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<StateWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<StateCreateOrConnectWithoutVinylsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<StateCreateWithoutVinylsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
