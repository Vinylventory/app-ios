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
    case "PlayedBy": return VinylventoryAPI.Objects.PlayedBy
    case "Artist": return VinylventoryAPI.Objects.Artist
    case "Authored": return VinylventoryAPI.Objects.Authored
    case "Credit": return VinylventoryAPI.Objects.Credit
    case "Album": return VinylventoryAPI.Objects.Album
    case "Label": return VinylventoryAPI.Objects.Label
    case "Track": return VinylventoryAPI.Objects.Track
    case "Bought": return VinylventoryAPI.Objects.Bought
    case "PocketState": return VinylventoryAPI.Objects.PocketState
    case "State": return VinylventoryAPI.Objects.State
    case "ReadSpeed": return VinylventoryAPI.Objects.ReadSpeed
    case "Image": return VinylventoryAPI.Objects.Image
    case "Mutation": return VinylventoryAPI.Objects.Mutation
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
