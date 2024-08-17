// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct AlbumCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    idAlbum: GraphQLNullable<String> = nil,
    name: String
  ) {
    __data = InputDict([
      "idAlbum": idAlbum,
      "name": name
    ])
  }

  public var idAlbum: GraphQLNullable<String> {
    get { __data["idAlbum"] }
    set { __data["idAlbum"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
