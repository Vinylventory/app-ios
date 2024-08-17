// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AuthoredCreateWithoutArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idAuthored: GraphQLNullable<String> = nil,
    vinyl: VinylCreateNestedOneWithoutAuthoredInput
  ) {
    __data = InputDict([
      "idAuthored": idAuthored,
      "vinyl": vinyl
    ])
  }

  public var idAuthored: GraphQLNullable<String> {
    get { __data["idAuthored"] }
    set { __data["idAuthored"] = newValue }
  }

  public var vinyl: VinylCreateNestedOneWithoutAuthoredInput {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
