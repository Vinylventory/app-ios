// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct ArtistCreateWithoutPlayedByInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    authored: GraphQLNullable<AuthoredCreateNestedManyWithoutArtistInput> = nil,
    credits: GraphQLNullable<CreditCreateNestedManyWithoutArtistInput> = nil,
    idArtist: GraphQLNullable<String> = nil,
    name: String,
    origin: String,
    surname: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "authored": authored,
      "credits": credits,
      "idArtist": idArtist,
      "name": name,
      "origin": origin,
      "surname": surname
    ])
  }

  public var authored: GraphQLNullable<AuthoredCreateNestedManyWithoutArtistInput> {
    get { __data["authored"] }
    set { __data["authored"] = newValue }
  }

  public var credits: GraphQLNullable<CreditCreateNestedManyWithoutArtistInput> {
    get { __data["credits"] }
    set { __data["credits"] = newValue }
  }

  public var idArtist: GraphQLNullable<String> {
    get { __data["idArtist"] }
    set { __data["idArtist"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var origin: String {
    get { __data["origin"] }
    set { __data["origin"] = newValue }
  }

  public var surname: GraphQLNullable<String> {
    get { __data["surname"] }
    set { __data["surname"] = newValue }
  }
}
