// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetVinylsQuery: GraphQLQuery {
  public static let operationName: String = "GetVinyls"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetVinyls { vinyls { __typename idVinyl catNumber } }"#
    ))

  public init() {}

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("vinyls", [Vinyl].self),
    ] }

    public var vinyls: [Vinyl] { __data["vinyls"] }

    /// Vinyl
    ///
    /// Parent Type: `Vinyl`
    public struct Vinyl: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Vinyl }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("idVinyl", String.self),
        .field("catNumber", String.self),
      ] }

      public var idVinyl: String { __data["idVinyl"] }
      public var catNumber: String { __data["catNumber"] }
    }
  }
}
