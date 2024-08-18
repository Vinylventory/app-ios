// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateVinylMutation: GraphQLMutation {
  public static let operationName: String = "CreateVinyl"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateVinyl($catNumber: String!, $dateReleased: DateTimeISO, $dateEdited: DateTimeISO, $notePocket: String, $pressingLoc: String, $edition: String, $weight: Int, $rank: Int, $notes: String, $playedBys: [PlayedByCreateWithoutVinylInput!], $authoreds: [AuthoredCreateWithoutVinylInput!], $credits: [CreditCreateWithoutVinylInput!], $album: AlbumCreateNestedOneWithoutVinylsInput, $label: LabelCreateNestedOneWithoutVinylsInput, $tracks: [TrackCreateManyVinylInput!]!, $bought: BoughtCreateNestedOneWithoutVinylsInput, $pocketState: String, $state: String, $readSpeed: String) { createOneVinyl( data: { catNumber: $catNumber dateReleased: $dateReleased dateEdited: $dateEdited notePocket: $notePocket pressingLoc: $pressingLoc edition: $edition weight: $weight rank: $rank notes: $notes playedBy: { create: $playedBys } authored: { create: $authoreds } credits: { create: $credits } album: $album label: $label tracks: { createMany: { data: $tracks } } bought: $bought pocketState: { connect: { name: $pocketState } } state: { connect: { name: $state } } readSpeed: { connect: { speed: $readSpeed } } } ) { __typename idVinyl } }"#
    ))

  public var catNumber: String
  public var dateReleased: GraphQLNullable<DateTimeISO>
  public var dateEdited: GraphQLNullable<DateTimeISO>
  public var notePocket: GraphQLNullable<String>
  public var pressingLoc: GraphQLNullable<String>
  public var edition: GraphQLNullable<String>
  public var weight: GraphQLNullable<Int>
  public var rank: GraphQLNullable<Int>
  public var notes: GraphQLNullable<String>
  public var playedBys: GraphQLNullable<[PlayedByCreateWithoutVinylInput]>
  public var authoreds: GraphQLNullable<[AuthoredCreateWithoutVinylInput]>
  public var credits: GraphQLNullable<[CreditCreateWithoutVinylInput]>
  public var album: GraphQLNullable<AlbumCreateNestedOneWithoutVinylsInput>
  public var label: GraphQLNullable<LabelCreateNestedOneWithoutVinylsInput>
  public var tracks: [TrackCreateManyVinylInput]
  public var bought: GraphQLNullable<BoughtCreateNestedOneWithoutVinylsInput>
  public var pocketState: GraphQLNullable<String>
  public var state: GraphQLNullable<String>
  public var readSpeed: GraphQLNullable<String>

  public init(
    catNumber: String,
    dateReleased: GraphQLNullable<DateTimeISO>,
    dateEdited: GraphQLNullable<DateTimeISO>,
    notePocket: GraphQLNullable<String>,
    pressingLoc: GraphQLNullable<String>,
    edition: GraphQLNullable<String>,
    weight: GraphQLNullable<Int>,
    rank: GraphQLNullable<Int>,
    notes: GraphQLNullable<String>,
    playedBys: GraphQLNullable<[PlayedByCreateWithoutVinylInput]>,
    authoreds: GraphQLNullable<[AuthoredCreateWithoutVinylInput]>,
    credits: GraphQLNullable<[CreditCreateWithoutVinylInput]>,
    album: GraphQLNullable<AlbumCreateNestedOneWithoutVinylsInput>,
    label: GraphQLNullable<LabelCreateNestedOneWithoutVinylsInput>,
    tracks: [TrackCreateManyVinylInput],
    bought: GraphQLNullable<BoughtCreateNestedOneWithoutVinylsInput>,
    pocketState: GraphQLNullable<String>,
    state: GraphQLNullable<String>,
    readSpeed: GraphQLNullable<String>
  ) {
    self.catNumber = catNumber
    self.dateReleased = dateReleased
    self.dateEdited = dateEdited
    self.notePocket = notePocket
    self.pressingLoc = pressingLoc
    self.edition = edition
    self.weight = weight
    self.rank = rank
    self.notes = notes
    self.playedBys = playedBys
    self.authoreds = authoreds
    self.credits = credits
    self.album = album
    self.label = label
    self.tracks = tracks
    self.bought = bought
    self.pocketState = pocketState
    self.state = state
    self.readSpeed = readSpeed
  }

  public var __variables: Variables? { [
    "catNumber": catNumber,
    "dateReleased": dateReleased,
    "dateEdited": dateEdited,
    "notePocket": notePocket,
    "pressingLoc": pressingLoc,
    "edition": edition,
    "weight": weight,
    "rank": rank,
    "notes": notes,
    "playedBys": playedBys,
    "authoreds": authoreds,
    "credits": credits,
    "album": album,
    "label": label,
    "tracks": tracks,
    "bought": bought,
    "pocketState": pocketState,
    "state": state,
    "readSpeed": readSpeed
  ] }

  public struct Data: VinylventoryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createOneVinyl", CreateOneVinyl.self, arguments: ["data": [
        "catNumber": .variable("catNumber"),
        "dateReleased": .variable("dateReleased"),
        "dateEdited": .variable("dateEdited"),
        "notePocket": .variable("notePocket"),
        "pressingLoc": .variable("pressingLoc"),
        "edition": .variable("edition"),
        "weight": .variable("weight"),
        "rank": .variable("rank"),
        "notes": .variable("notes"),
        "playedBy": ["create": .variable("playedBys")],
        "authored": ["create": .variable("authoreds")],
        "credits": ["create": .variable("credits")],
        "album": .variable("album"),
        "label": .variable("label"),
        "tracks": ["createMany": ["data": .variable("tracks")]],
        "bought": .variable("bought"),
        "pocketState": ["connect": ["name": .variable("pocketState")]],
        "state": ["connect": ["name": .variable("state")]],
        "readSpeed": ["connect": ["speed": .variable("readSpeed")]]
      ]]),
    ] }

    public var createOneVinyl: CreateOneVinyl { __data["createOneVinyl"] }

    /// CreateOneVinyl
    ///
    /// Parent Type: `Vinyl`
    public struct CreateOneVinyl: VinylventoryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { VinylventoryAPI.Objects.Vinyl }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("idVinyl", String.self),
      ] }

      public var idVinyl: String { __data["idVinyl"] }
    }
  }
}
