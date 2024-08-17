// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct VinylCreateNestedOneWithoutPlayedByInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<VinylWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<VinylCreateOrConnectWithoutPlayedByInput> = nil,
    create: GraphQLNullable<VinylCreateWithoutPlayedByInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<VinylWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<VinylCreateOrConnectWithoutPlayedByInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<VinylCreateWithoutPlayedByInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
