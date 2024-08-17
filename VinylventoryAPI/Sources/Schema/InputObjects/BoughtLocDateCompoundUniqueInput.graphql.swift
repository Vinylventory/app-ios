// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BoughtLocDateCompoundUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    date: DateTimeISO,
    loc: String
  ) {
    __data = InputDict([
      "date": date,
      "loc": loc
    ])
  }

  public var date: DateTimeISO {
    get { __data["date"] }
    set { __data["date"] = newValue }
  }

  public var loc: String {
    get { __data["loc"] }
    set { __data["loc"] = newValue }
  }
}
