// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct VinylWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    and: GraphQLNullable<[VinylWhereInput]> = nil,
    not: GraphQLNullable<[VinylWhereInput]> = nil,
    or: GraphQLNullable<[VinylWhereInput]> = nil,
    album: GraphQLNullable<AlbumNullableRelationFilter> = nil,
    authored: GraphQLNullable<AuthoredListRelationFilter> = nil,
    bought: GraphQLNullable<BoughtNullableRelationFilter> = nil,
    catNumber: GraphQLNullable<StringFilter> = nil,
    credits: GraphQLNullable<CreditListRelationFilter> = nil,
    dateCreated: GraphQLNullable<DateTimeFilter> = nil,
    dateEdited: GraphQLNullable<DateTimeNullableFilter> = nil,
    dateReleased: GraphQLNullable<DateTimeNullableFilter> = nil,
    edition: GraphQLNullable<StringNullableFilter> = nil,
    idAlbum: GraphQLNullable<StringNullableFilter> = nil,
    idBought: GraphQLNullable<StringNullableFilter> = nil,
    idLabel: GraphQLNullable<StringNullableFilter> = nil,
    idPocketState: GraphQLNullable<StringNullableFilter> = nil,
    idReadSpeed: GraphQLNullable<StringFilter> = nil,
    idState: GraphQLNullable<StringNullableFilter> = nil,
    idVinyl: GraphQLNullable<String> = nil,
    images: GraphQLNullable<ImageListRelationFilter> = nil,
    label: GraphQLNullable<LabelNullableRelationFilter> = nil,
    notePocket: GraphQLNullable<StringNullableFilter> = nil,
    notes: GraphQLNullable<StringNullableFilter> = nil,
    playedBy: GraphQLNullable<PlayedByListRelationFilter> = nil,
    pocketState: GraphQLNullable<PocketStateNullableRelationFilter> = nil,
    pressingLoc: GraphQLNullable<StringNullableFilter> = nil,
    rank: GraphQLNullable<IntNullableFilter> = nil,
    readSpeed: GraphQLNullable<ReadSpeedRelationFilter> = nil,
    state: GraphQLNullable<StateNullableRelationFilter> = nil,
    tracks: GraphQLNullable<TrackListRelationFilter> = nil,
    weight: GraphQLNullable<IntNullableFilter> = nil
  ) {
    __data = InputDict([
      "AND": and,
      "NOT": not,
      "OR": or,
      "album": album,
      "authored": authored,
      "bought": bought,
      "catNumber": catNumber,
      "credits": credits,
      "dateCreated": dateCreated,
      "dateEdited": dateEdited,
      "dateReleased": dateReleased,
      "edition": edition,
      "idAlbum": idAlbum,
      "idBought": idBought,
      "idLabel": idLabel,
      "idPocketState": idPocketState,
      "idReadSpeed": idReadSpeed,
      "idState": idState,
      "idVinyl": idVinyl,
      "images": images,
      "label": label,
      "notePocket": notePocket,
      "notes": notes,
      "playedBy": playedBy,
      "pocketState": pocketState,
      "pressingLoc": pressingLoc,
      "rank": rank,
      "readSpeed": readSpeed,
      "state": state,
      "tracks": tracks,
      "weight": weight
    ])
  }

  public var and: GraphQLNullable<[VinylWhereInput]> {
    get { __data["AND"] }
    set { __data["AND"] = newValue }
  }

  public var not: GraphQLNullable<[VinylWhereInput]> {
    get { __data["NOT"] }
    set { __data["NOT"] = newValue }
  }

  public var or: GraphQLNullable<[VinylWhereInput]> {
    get { __data["OR"] }
    set { __data["OR"] = newValue }
  }

  public var album: GraphQLNullable<AlbumNullableRelationFilter> {
    get { __data["album"] }
    set { __data["album"] = newValue }
  }

  public var authored: GraphQLNullable<AuthoredListRelationFilter> {
    get { __data["authored"] }
    set { __data["authored"] = newValue }
  }

  public var bought: GraphQLNullable<BoughtNullableRelationFilter> {
    get { __data["bought"] }
    set { __data["bought"] = newValue }
  }

  public var catNumber: GraphQLNullable<StringFilter> {
    get { __data["catNumber"] }
    set { __data["catNumber"] = newValue }
  }

  public var credits: GraphQLNullable<CreditListRelationFilter> {
    get { __data["credits"] }
    set { __data["credits"] = newValue }
  }

  public var dateCreated: GraphQLNullable<DateTimeFilter> {
    get { __data["dateCreated"] }
    set { __data["dateCreated"] = newValue }
  }

  public var dateEdited: GraphQLNullable<DateTimeNullableFilter> {
    get { __data["dateEdited"] }
    set { __data["dateEdited"] = newValue }
  }

  public var dateReleased: GraphQLNullable<DateTimeNullableFilter> {
    get { __data["dateReleased"] }
    set { __data["dateReleased"] = newValue }
  }

  public var edition: GraphQLNullable<StringNullableFilter> {
    get { __data["edition"] }
    set { __data["edition"] = newValue }
  }

  public var idAlbum: GraphQLNullable<StringNullableFilter> {
    get { __data["idAlbum"] }
    set { __data["idAlbum"] = newValue }
  }

  public var idBought: GraphQLNullable<StringNullableFilter> {
    get { __data["idBought"] }
    set { __data["idBought"] = newValue }
  }

  public var idLabel: GraphQLNullable<StringNullableFilter> {
    get { __data["idLabel"] }
    set { __data["idLabel"] = newValue }
  }

  public var idPocketState: GraphQLNullable<StringNullableFilter> {
    get { __data["idPocketState"] }
    set { __data["idPocketState"] = newValue }
  }

  public var idReadSpeed: GraphQLNullable<StringFilter> {
    get { __data["idReadSpeed"] }
    set { __data["idReadSpeed"] = newValue }
  }

  public var idState: GraphQLNullable<StringNullableFilter> {
    get { __data["idState"] }
    set { __data["idState"] = newValue }
  }

  public var idVinyl: GraphQLNullable<String> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var images: GraphQLNullable<ImageListRelationFilter> {
    get { __data["images"] }
    set { __data["images"] = newValue }
  }

  public var label: GraphQLNullable<LabelNullableRelationFilter> {
    get { __data["label"] }
    set { __data["label"] = newValue }
  }

  public var notePocket: GraphQLNullable<StringNullableFilter> {
    get { __data["notePocket"] }
    set { __data["notePocket"] = newValue }
  }

  public var notes: GraphQLNullable<StringNullableFilter> {
    get { __data["notes"] }
    set { __data["notes"] = newValue }
  }

  public var playedBy: GraphQLNullable<PlayedByListRelationFilter> {
    get { __data["playedBy"] }
    set { __data["playedBy"] = newValue }
  }

  public var pocketState: GraphQLNullable<PocketStateNullableRelationFilter> {
    get { __data["pocketState"] }
    set { __data["pocketState"] = newValue }
  }

  public var pressingLoc: GraphQLNullable<StringNullableFilter> {
    get { __data["pressingLoc"] }
    set { __data["pressingLoc"] = newValue }
  }

  public var rank: GraphQLNullable<IntNullableFilter> {
    get { __data["rank"] }
    set { __data["rank"] = newValue }
  }

  public var readSpeed: GraphQLNullable<ReadSpeedRelationFilter> {
    get { __data["readSpeed"] }
    set { __data["readSpeed"] = newValue }
  }

  public var state: GraphQLNullable<StateNullableRelationFilter> {
    get { __data["state"] }
    set { __data["state"] = newValue }
  }

  public var tracks: GraphQLNullable<TrackListRelationFilter> {
    get { __data["tracks"] }
    set { __data["tracks"] = newValue }
  }

  public var weight: GraphQLNullable<IntNullableFilter> {
    get { __data["weight"] }
    set { __data["weight"] = newValue }
  }
}
