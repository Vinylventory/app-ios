// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistCreateNestedOneWithoutCreditsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<ArtistWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<ArtistCreateOrConnectWithoutCreditsInput> = nil,
    create: GraphQLNullable<ArtistCreateWithoutCreditsInput> = nil
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

  public var connectOrCreate: GraphQLNullable<ArtistCreateOrConnectWithoutCreditsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<ArtistCreateWithoutCreditsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
