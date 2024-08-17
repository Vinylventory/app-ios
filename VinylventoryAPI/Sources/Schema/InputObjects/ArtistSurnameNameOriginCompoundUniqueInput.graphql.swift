// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistSurnameNameOriginCompoundUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    name: String,
    origin: String,
    surname: String
  ) {
    __data = InputDict([
      "name": name,
      "origin": origin,
      "surname": surname
    ])
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var origin: String {
    get { __data["origin"] }
    set { __data["origin"] = newValue }
  }

  public var surname: String {
    get { __data["surname"] }
    set { __data["surname"] = newValue }
  }
}
