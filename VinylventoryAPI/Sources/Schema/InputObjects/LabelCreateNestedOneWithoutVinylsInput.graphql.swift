// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct LabelCreateNestedOneWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    connect: GraphQLNullable<LabelWhereUniqueInput> = nil,
    connectOrCreate: GraphQLNullable<LabelCreateOrConnectWithoutVinylsInput> = nil,
    create: GraphQLNullable<LabelCreateWithoutVinylsInput> = nil
  ) {
    __data = InputDict([
      "connect": connect,
      "connectOrCreate": connectOrCreate,
      "create": create
    ])
  }

  public var connect: GraphQLNullable<LabelWhereUniqueInput> {
    get { __data["connect"] }
    set { __data["connect"] = newValue }
  }

  public var connectOrCreate: GraphQLNullable<LabelCreateOrConnectWithoutVinylsInput> {
    get { __data["connectOrCreate"] }
    set { __data["connectOrCreate"] = newValue }
  }

  public var create: GraphQLNullable<LabelCreateWithoutVinylsInput> {
    get { __data["create"] }
    set { __data["create"] = newValue }
  }
}
