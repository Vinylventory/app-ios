// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ImageCreateWithoutVinylInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idImage: GraphQLNullable<String> = nil,
    path: String
  ) {
    __data = InputDict([
      "idImage": idImage,
      "path": path
    ])
  }

  public var idImage: GraphQLNullable<String> {
    get { __data["idImage"] }
    set { __data["idImage"] = newValue }
  }

  public var path: String {
    get { __data["path"] }
    set { __data["path"] = newValue }
  }
}
