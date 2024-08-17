// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageCreateManyVinylInputEnvelope: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    data: [ImageCreateManyVinylInput],
    skipDuplicates: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "data": data,
      "skipDuplicates": skipDuplicates
    ])
  }

  public var data: [ImageCreateManyVinylInput] {
    get { __data["data"] }
    set { __data["data"] = newValue }
  }

  public var skipDuplicates: GraphQLNullable<Bool> {
    get { __data["skipDuplicates"] }
    set { __data["skipDuplicates"] = newValue }
  }
}
