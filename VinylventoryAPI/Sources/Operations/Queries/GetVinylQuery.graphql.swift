// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetVinylQuery: GraphQLQuery {
  public static let operationName: String = "GetVinyl"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetVinyl($idVinyl: String!) { vinyl(where: { idVinyl: $idVinyl }) { __typename idVinyl catNumber dateCreated dateReleased dateEdited notePocket pressingLoc edition weight rank notes playedBy { __typename artist { __typename idArtist surname name origin } } authored { __typename artist { __typename idArtist surname name origin } } credits { __typename idCredit role note artist { __typename idArtist surname name origin } } album { __typename idAlbum name } label { __typename idLabel name } tracks { __typename idTrack name duration } bought { __typename idBought loc date price note } pocketState { __typename idPocketState name } state { __typename idState name } readSpeed { __typename idReadSpeed speed } images { __typename idImage path } } }"#
    ))

  public var idVinyl: String

  public init(idVinyl: String) {
    self.idVinyl = idVinyl
  }

  public var __variables: Variables? { ["idVinyl": idVinyl] }

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("vinyl", Vinyl?.self, arguments: ["where": ["idVinyl": .variable("idVinyl")]]),
    ] }

    public var vinyl: Vinyl? { __data["vinyl"] }

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
        .field("dateCreated", VinylventoryAPI.DateTimeISO.self),
        .field("dateReleased", VinylventoryAPI.DateTimeISO?.self),
        .field("dateEdited", VinylventoryAPI.DateTimeISO?.self),
        .field("notePocket", String?.self),
        .field("pressingLoc", String?.self),
        .field("edition", String?.self),
        .field("weight", Int?.self),
        .field("rank", Int?.self),
        .field("notes", String?.self),
        .field("playedBy", [PlayedBy].self),
        .field("authored", [Authored].self),
        .field("credits", [Credit].self),
        .field("album", Album?.self),
        .field("label", Label?.self),
        .field("tracks", [Track].self),
        .field("bought", Bought?.self),
        .field("pocketState", PocketState?.self),
        .field("state", State?.self),
        .field("readSpeed", ReadSpeed.self),
        .field("images", [Image].self),
      ] }

      public var idVinyl: String { __data["idVinyl"] }
      public var catNumber: String { __data["catNumber"] }
      public var dateCreated: VinylventoryAPI.DateTimeISO { __data["dateCreated"] }
      public var dateReleased: VinylventoryAPI.DateTimeISO? { __data["dateReleased"] }
      public var dateEdited: VinylventoryAPI.DateTimeISO? { __data["dateEdited"] }
      public var notePocket: String? { __data["notePocket"] }
      public var pressingLoc: String? { __data["pressingLoc"] }
      public var edition: String? { __data["edition"] }
      public var weight: Int? { __data["weight"] }
      public var rank: Int? { __data["rank"] }
      public var notes: String? { __data["notes"] }
      public var playedBy: [PlayedBy] { __data["playedBy"] }
      public var authored: [Authored] { __data["authored"] }
      public var credits: [Credit] { __data["credits"] }
      public var album: Album? { __data["album"] }
      public var label: Label? { __data["label"] }
      public var tracks: [Track] { __data["tracks"] }
      public var bought: Bought? { __data["bought"] }
      public var pocketState: PocketState? { __data["pocketState"] }
      public var state: State? { __data["state"] }
      public var readSpeed: ReadSpeed { __data["readSpeed"] }
      public var images: [Image] { __data["images"] }

      /// Vinyl.PlayedBy
      ///
      /// Parent Type: `PlayedBy`
      public struct PlayedBy: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.PlayedBy }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("artist", Artist.self),
        ] }

        public var artist: Artist { __data["artist"] }

        /// Vinyl.PlayedBy.Artist
        ///
        /// Parent Type: `Artist`
        public struct Artist: VinylventoryAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Artist }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("idArtist", String.self),
            .field("surname", String?.self),
            .field("name", String.self),
            .field("origin", String.self),
          ] }

          public var idArtist: String { __data["idArtist"] }
          public var surname: String? { __data["surname"] }
          public var name: String { __data["name"] }
          public var origin: String { __data["origin"] }
        }
      }

      /// Vinyl.Authored
      ///
      /// Parent Type: `Authored`
      public struct Authored: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Authored }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("artist", Artist.self),
        ] }

        public var artist: Artist { __data["artist"] }

        /// Vinyl.Authored.Artist
        ///
        /// Parent Type: `Artist`
        public struct Artist: VinylventoryAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Artist }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("idArtist", String.self),
            .field("surname", String?.self),
            .field("name", String.self),
            .field("origin", String.self),
          ] }

          public var idArtist: String { __data["idArtist"] }
          public var surname: String? { __data["surname"] }
          public var name: String { __data["name"] }
          public var origin: String { __data["origin"] }
        }
      }

      /// Vinyl.Credit
      ///
      /// Parent Type: `Credit`
      public struct Credit: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Credit }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idCredit", String.self),
          .field("role", String?.self),
          .field("note", String?.self),
          .field("artist", Artist.self),
        ] }

        public var idCredit: String { __data["idCredit"] }
        public var role: String? { __data["role"] }
        public var note: String? { __data["note"] }
        public var artist: Artist { __data["artist"] }

        /// Vinyl.Credit.Artist
        ///
        /// Parent Type: `Artist`
        public struct Artist: VinylventoryAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Artist }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("idArtist", String.self),
            .field("surname", String?.self),
            .field("name", String.self),
            .field("origin", String.self),
          ] }

          public var idArtist: String { __data["idArtist"] }
          public var surname: String? { __data["surname"] }
          public var name: String { __data["name"] }
          public var origin: String { __data["origin"] }
        }
      }

      /// Vinyl.Album
      ///
      /// Parent Type: `Album`
      public struct Album: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Album }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idAlbum", String.self),
          .field("name", String.self),
        ] }

        public var idAlbum: String { __data["idAlbum"] }
        public var name: String { __data["name"] }
      }

      /// Vinyl.Label
      ///
      /// Parent Type: `Label`
      public struct Label: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Label }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idLabel", String.self),
          .field("name", String.self),
        ] }

        public var idLabel: String { __data["idLabel"] }
        public var name: String { __data["name"] }
      }

      /// Vinyl.Track
      ///
      /// Parent Type: `Track`
      public struct Track: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Track }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idTrack", String.self),
          .field("name", String.self),
          .field("duration", Int?.self),
        ] }

        public var idTrack: String { __data["idTrack"] }
        public var name: String { __data["name"] }
        public var duration: Int? { __data["duration"] }
      }

      /// Vinyl.Bought
      ///
      /// Parent Type: `Bought`
      public struct Bought: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Bought }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idBought", String.self),
          .field("loc", String.self),
          .field("date", VinylventoryAPI.DateTimeISO.self),
          .field("price", Int?.self),
          .field("note", String?.self),
        ] }

        public var idBought: String { __data["idBought"] }
        public var loc: String { __data["loc"] }
        public var date: VinylventoryAPI.DateTimeISO { __data["date"] }
        public var price: Int? { __data["price"] }
        public var note: String? { __data["note"] }
      }

      /// Vinyl.PocketState
      ///
      /// Parent Type: `PocketState`
      public struct PocketState: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.PocketState }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idPocketState", String.self),
          .field("name", String.self),
        ] }

        public var idPocketState: String { __data["idPocketState"] }
        public var name: String { __data["name"] }
      }

      /// Vinyl.State
      ///
      /// Parent Type: `State`
      public struct State: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.State }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idState", String.self),
          .field("name", String.self),
        ] }

        public var idState: String { __data["idState"] }
        public var name: String { __data["name"] }
      }

      /// Vinyl.ReadSpeed
      ///
      /// Parent Type: `ReadSpeed`
      public struct ReadSpeed: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.ReadSpeed }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idReadSpeed", String.self),
          .field("speed", String.self),
        ] }

        public var idReadSpeed: String { __data["idReadSpeed"] }
        public var speed: String { __data["speed"] }
      }

      /// Vinyl.Image
      ///
      /// Parent Type: `Image`
      public struct Image: VinylventoryAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Image }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("idImage", String.self),
          .field("path", String.self),
        ] }

        public var idImage: String { __data["idImage"] }
        public var path: String { __data["path"] }
      }
    }
  }
}
