// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistCreateNestedOneWithoutAuthoredInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<ArtistWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<ArtistCreateOrConnectWithoutAuthoredInput> = nil,
    create: GraphQLNullable<ArtistCreateWithoutAuthoredInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<ArtistWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<ArtistCreateOrConnectWithoutAuthoredInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<ArtistCreateWithoutAuthoredInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
