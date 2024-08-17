// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetStatesQuery: GraphQLQuery {
  public static let operationName: String = "GetStates"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetStates { states { __typename name } }"#
    ))

  public init() {}

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("states", [State].self),
    ] }

    public var states: [State] { __data["states"] }

    /// State
    ///
    /// Parent Type: `State`
    public struct State: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.State }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
