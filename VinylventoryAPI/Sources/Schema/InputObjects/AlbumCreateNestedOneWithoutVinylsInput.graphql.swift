// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AlbumCreateNestedOneWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<AlbumWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<AlbumCreateOrConnectWithoutVinylsInput> = nil,
    create: GraphQLNullable<AlbumCreateWithoutVinylsInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<AlbumWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<AlbumCreateOrConnectWithoutVinylsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<AlbumCreateWithoutVinylsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
