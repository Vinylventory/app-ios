// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPocketStatesQuery: GraphQLQuery {
  public static let operationName: String = "GetPocketStates"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPocketStates { pocketStates { __typename name } }"#
    ))

  public init() {}

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pocketStates", [PocketState].self),
    ] }

    public var pocketStates: [PocketState] { __data["pocketStates"] }

    /// PocketState
    ///
    /// Parent Type: `PocketState`
    public struct PocketState: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.PocketState }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
