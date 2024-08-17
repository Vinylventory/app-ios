// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct TrackCreateNestedManyWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<[TrackWhereUniqueInput]> = nil,
    connectOrCreate: GraphQLNullable<[TrackCreateOrConnectWithoutVinylInput]> = nil,
    create: GraphQLNullable<[TrackCreateWithoutVinylInput]> = nil,
    createMany: GraphQLNullable<TrackCreateManyVinylInputEnvelope> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create,
      "createMany": createMany
    ])
  }

  public var connect: GraphQLNullable<[TrackWhereUniqueInput]> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<[TrackCreateOrConnectWithoutVinylInput]> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<[TrackCreateWithoutVinylInput]> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }

  public var createMany: GraphQLNullable<TrackCreateManyVinylInputEnvelope> {
    get { __data["createMany"] }
    set { __data["createMany"] = newValue }
  }
}
