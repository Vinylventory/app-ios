// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct PlayedByCreateWithoutArtistInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idPlayedBy: GraphQLNullable<String> = nil,
    vinyl: VinylCreateNestedOneWithoutPlayedByInput
  ) {
    __data = InputDict([
      "idPlayedBy": idPlayedBy,
      "vinyl": vinyl
    ])
  }

  public var idPlayedBy: GraphQLNullable<String> {
    get { __data["idPlayedBy"] }
    set { __data["idPlayedBy"] = newValue }
  }

  public var vinyl: VinylCreateNestedOneWithoutPlayedByInput {
    get { __data["vinyl"] }
    set { __data["vinyl"] = newValue }
  }
}
