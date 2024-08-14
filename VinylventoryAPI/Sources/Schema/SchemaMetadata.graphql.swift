// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == VinylventoryAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == VinylventoryAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == VinylventoryAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == VinylventoryAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return VinylventoryAPI.Objects.Query
    case "Vinyl": return VinylventoryAPI.Objects.Vinyl
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
