// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetArtistsQuery: GraphQLQuery {
  public static let operationName: String = "GetArtists"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetArtists { artists { __typename surname name origin } }"#
    ))

  public init() {}

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("artists", [Artist].self),
    ] }

    public var artists: [Artist] { __data["artists"] }

    /// Artist
    ///
    /// Parent Type: `Artist`
    public struct Artist: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Artist }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("surname", String?.self),
        .field("name", String.self),
        .field("origin", String.self),
      ] }

      public var surname: String? { __data["surname"] }
      public var name: String { __data["name"] }
      public var origin: String { __data["origin"] }
    }
  }
}
