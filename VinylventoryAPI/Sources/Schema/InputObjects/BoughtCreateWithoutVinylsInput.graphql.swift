// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BoughtCreateWithoutVinylsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    date: DateTimeISO,
    idBought: GraphQLNullable<String> = nil,
    loc: String,
    note: GraphQLNullable<String> = nil,
    price: GraphQLNullable<Int> = nil
  ) {
    __data = InputDict([
      "date": date,
      "idBought": idBought,
      "loc": loc,
      "note": note,
      "price": price
    ])
  }

  public var date: DateTimeISO {
    get { __data["date"] }
    set { __data["date"] = newValue }
  }

  public var idBought: GraphQLNullable<String> {
    get { __data["idBought"] }
    set { __data["idBought"] = newValue }
  }

  public var loc: String {
    get { __data["loc"] }
    set { __data["loc"] = newValue }
  }

  public var note: GraphQLNullable<String> {
    get { __data["note"] }
    set { __data["note"] = newValue }
  }

  public var price: GraphQLNullable<Int> {
    get { __data["price"] }
    set { __data["price"] = newValue }
  }
}
