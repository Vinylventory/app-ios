// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateVinylMutation: GraphQLMutation {
  public static let operationName: String = "CreateVinyl"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateVinyl($catNumber: String!, $dateReleased: DateTimeISO, $dateEdited: DateTimeISO, $notePocket: String, $pressingLoc: String, $edition: String, $weight: Int, $rank: Int, $notes: String, $playedBys: [PlayedByCreateWithoutVinylInput!], $authoreds: [AuthoredCreateWithoutVinylInput!], $credits: [CreditCreateWithoutVinylInput!], $album: String!, $label: String!, $tracks: [TrackCreateManyVinylInput!]!, $boughtLoc: String!, $boughtDate: DateTimeISO!, $boughtPrice: Int, $boughtNote: String, $pocketState: String, $state: String, $readSpeed: String, $images: [ImageWhereUniqueInput!]) { createOneVinyl( data: { catNumber: $catNumber dateReleased: $dateReleased dateEdited: $dateEdited notePocket: $notePocket pressingLoc: $pressingLoc edition: $edition weight: $weight rank: $rank notes: $notes playedBy: { create: $playedBys } authored: { create: $authoreds } credits: { create: $credits } album: { connectOrCreate: { where: { name: $album }, create: { name: $album } } } label: { connectOrCreate: { where: { name: $label }, create: { name: $label } } } tracks: { createMany: { data: $tracks } } bought: { connectOrCreate: { where: { loc_date: { loc: $boughtLoc, date: $boughtDate } } create: { loc: $boughtLoc, date: $boughtDate, price: $boughtPrice, note: $boughtNote } } } pocketState: { connect: { name: $pocketState } } state: { connect: { name: $state } } readSpeed: { connect: { speed: $readSpeed } } images: { connect: $images } } ) { __typename idVinyl } }"#
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
  public var album: String
  public var label: String
  public var tracks: [TrackCreateManyVinylInput]
  public var boughtLoc: String
  public var boughtDate: DateTimeISO
  public var boughtPrice: GraphQLNullable<Int>
  public var boughtNote: GraphQLNullable<String>
  public var pocketState: GraphQLNullable<String>
  public var state: GraphQLNullable<String>
  public var readSpeed: GraphQLNullable<String>
  public var images: GraphQLNullable<[ImageWhereUniqueInput]>

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
    album: String,
    label: String,
    tracks: [TrackCreateManyVinylInput],
    boughtLoc: String,
    boughtDate: DateTimeISO,
    boughtPrice: GraphQLNullable<Int>,
    boughtNote: GraphQLNullable<String>,
    pocketState: GraphQLNullable<String>,
    state: GraphQLNullable<String>,
    readSpeed: GraphQLNullable<String>,
    images: GraphQLNullable<[ImageWhereUniqueInput]>
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
    self.boughtLoc = boughtLoc
    self.boughtDate = boughtDate
    self.boughtPrice = boughtPrice
    self.boughtNote = boughtNote
    self.pocketState = pocketState
    self.state = state
    self.readSpeed = readSpeed
    self.images = images
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
    "boughtLoc": boughtLoc,
    "boughtDate": boughtDate,
    "boughtPrice": boughtPrice,
    "boughtNote": boughtNote,
    "pocketState": pocketState,
    "state": state,
    "readSpeed": readSpeed,
    "images": images
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
        "album": ["connectOrCreate": [
          "where": ["name": .variable("album")],
          "create": ["name": .variable("album")]
        ]],
        "label": ["connectOrCreate": [
          "where": ["name": .variable("label")],
          "create": ["name": .variable("label")]
        ]],
        "tracks": ["createMany": ["data": .variable("tracks")]],
        "bought": ["connectOrCreate": [
          "where": ["loc_date": [
            "loc": .variable("boughtLoc"),
            "date": .variable("boughtDate")
          ]],
          "create": [
            "loc": .variable("boughtLoc"),
            "date": .variable("boughtDate"),
            "price": .variable("boughtPrice"),
            "note": .variable("boughtNote")
          ]
        ]],
        "pocketState": ["connect": ["name": .variable("pocketState")]],
        "state": ["connect": ["name": .variable("state")]],
        "readSpeed": ["connect": ["speed": .variable("readSpeed")]],
        "images": ["connect": .variable("images")]
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
