// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetReadSpeedQuery: GraphQLQuery {
  public static let operationName: String = "GetReadSpeed"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetReadSpeed { readSpeeds { __typename speed } }"#
    ))

  public init() {}

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("readSpeeds", [ReadSpeed].self),
    ] }

    public var readSpeeds: [ReadSpeed] { __data["readSpeeds"] }

    /// ReadSpeed
    ///
    /// Parent Type: `ReadSpeed`
    public struct ReadSpeed: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.ReadSpeed }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("speed", String.self),
      ] }

      public var speed: String { __data["speed"] }
    }
  }
}
