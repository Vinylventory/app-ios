// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct BoughtWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[BoughtWhereInput]> = nil,
    not: GraphQLNullable<[BoughtWhereInput]> = nil,
    or: GraphQLNullable<[BoughtWhereInput]> = nil,
    date: GraphQLNullable<DateTimeFilter> = nil,
    idBought: GraphQLNullable<String> = nil,
    loc: GraphQLNullable<StringFilter> = nil,
    locDate: GraphQLNullable<BoughtLocDateCompoundUniqueInput> = nil,
    note: GraphQLNullable<StringNullableFilter> = nil,
    price: GraphQLNullable<IntNullableFilter> = nil,
    vinyls: GraphQLNullable<VinylListRelationFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "date": date,
      "idBought": idBought,
      "loc": loc,
      "loc_date": locDate,
      "note": note,
      "price": price,
      "vinyls": vinyls
    ])
  }

  public var and: GraphQLNullable<[BoughtWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[BoughtWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[BoughtWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var date: GraphQLNullable<DateTimeFilter> {
    get { __data["date"] }
    set { __data["date"] = newValue }
  }

  public var idBought: GraphQLNullable<String> {
    get { __data["idBought"] }
    set { __data["idBought"] = newValue }
  }

  public var loc: GraphQLNullable<StringFilter> {
    get { __data["loc"] }
    set { __data["loc"] = newValue }
  }

  public var locDate: GraphQLNullable<BoughtLocDateCompoundUniqueInput> {
    get { __data["loc_date"] }
    set { __data["loc_date"] = newValue }
  }

  public var note: GraphQLNullable<StringNullableFilter> {
    get { __data["note"] }
    set { __data["note"] = newValue }
  }

  public var price: GraphQLNullable<IntNullableFilter> {
    get { __data["price"] }
    set { __data["price"] = newValue }
  }

  public var vinyls: GraphQLNullable<VinylListRelationFilter> {
    get { __data["vinyls"] }
    set { __data["vinyls"] = newValue }
  }
}
