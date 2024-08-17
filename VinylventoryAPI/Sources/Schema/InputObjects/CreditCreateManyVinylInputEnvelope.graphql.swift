// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreditCreateManyVinylInputEnvelope: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    data: [CreditCreateManyVinylInput],
    skipDuplicates: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "data": data,
      "skipDuplicates": skipDuplicates
    ])
  }

  public var data: [CreditCreateManyVinylInput] {
    get { __data["data"] }
    set { __data["data"] = newValue }
  }

  public var skipDuplicates: GraphQLNullable<Bool> {
    get { __data["skipDuplicates"] }
    set { __data["skipDuplicates"] = newValue }
  }
}
