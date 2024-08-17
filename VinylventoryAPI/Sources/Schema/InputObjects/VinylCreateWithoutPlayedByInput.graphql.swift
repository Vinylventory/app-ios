// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct VinylCreateWithoutPlayedByInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    album: GraphQLNullable<AlbumCreateNestedOneWithoutVinylsInput> = nil,
    authored: GraphQLNullable<AuthoredCreateNestedManyWithoutVinylInput> = nil,
    bought: GraphQLNullable<BoughtCreateNestedOneWithoutVinylsInput> = nil,
    catNumber: String,
    credits: GraphQLNullable<CreditCreateNestedManyWithoutVinylInput> = nil,
    dateCreated: GraphQLNullable<DateTimeISO> = nil,
    dateEdited: GraphQLNullable<DateTimeISO> = nil,
    dateReleased: GraphQLNullable<DateTimeISO> = nil,
    edition: GraphQLNullable<String> = nil,
    idVinyl: GraphQLNullable<String> = nil,
    images: GraphQLNullable<ImageCreateNestedManyWithoutVinylInput> = nil,
    label: GraphQLNullable<LabelCreateNestedOneWithoutVinylsInput> = nil,
    notePocket: GraphQLNullable<String> = nil,
    notes: GraphQLNullable<String> = nil,
    pocketState: GraphQLNullable<PocketStateCreateNestedOneWithoutVinylsInput> = nil,
    pressingLoc: GraphQLNullable<String> = nil,
    rank: GraphQLNullable<Int> = nil,
    readSpeed: ReadSpeedCreateNestedOneWithoutVinylsInput,
    state: GraphQLNullable<StateCreateNestedOneWithoutVinylsInput> = nil,
    tracks: GraphQLNullable<TrackCreateNestedManyWithoutVinylInput> = nil,
    weight: GraphQLNullable<Int> = nil
  ) {
    __data = InputDict([
      "album": album,
      "authored": authored,
      "bought": bought,
      "catNumber": catNumber,
      "credits": credits,
      "dateCreated": dateCreated,
      "dateEdited": dateEdited,
      "dateReleased": dateReleased,
      "edition": edition,
      "idVinyl": idVinyl,
      "images": images,
      "label": label,
      "notePocket": notePocket,
      "notes": notes,
      "pocketState": pocketState,
      "pressingLoc": pressingLoc,
      "rank": rank,
      "readSpeed": readSpeed,
      "state": state,
      "tracks": tracks,
      "weight": weight
    ])
  }

  public var album: GraphQLNullable<AlbumCreateNestedOneWithoutVinylsInput> {
    get { __data["album"] }
    set { __data["album"] = newValue }
  }

  public var authored: GraphQLNullable<AuthoredCreateNestedManyWithoutVinylInput> {
    get { __data["authored"] }
    set { __data["authored"] = newValue }
  }

  public var bought: GraphQLNullable<BoughtCreateNestedOneWithoutVinylsInput> {
    get { __data["bought"] }
    set { __data["bought"] = newValue }
  }

  public var catNumber: String {
    get { __data["catNumber"] }
    set { __data["catNumber"] = newValue }
  }

  public var credits: GraphQLNullable<CreditCreateNestedManyWithoutVinylInput> {
    get { __data["credits"] }
    set { __data["credits"] = newValue }
  }

  public var dateCreated: GraphQLNullable<DateTimeISO> {
    get { __data["dateCreated"] }
    set { __data["dateCreated"] = newValue }
  }

  public var dateEdited: GraphQLNullable<DateTimeISO> {
    get { __data["dateEdited"] }
    set { __data["dateEdited"] = newValue }
  }

  public var dateReleased: GraphQLNullable<DateTimeISO> {
    get { __data["dateReleased"] }
    set { __data["dateReleased"] = newValue }
  }

  public var edition: GraphQLNullable<String> {
    get { __data["edition"] }
    set { __data["edition"] = newValue }
  }

  public var idVinyl: GraphQLNullable<String> {
    get { __data["idVinyl"] }
    set { __data["idVinyl"] = newValue }
  }

  public var images: GraphQLNullable<ImageCreateNestedManyWithoutVinylInput> {
    get { __data["images"] }
    set { __data["images"] = newValue }
  }

  public var label: GraphQLNullable<LabelCreateNestedOneWithoutVinylsInput> {
    get { __data["label"] }
    set { __data["label"] = newValue }
  }

  public var notePocket: GraphQLNullable<String> {
    get { __data["notePocket"] }
    set { __data["notePocket"] = newValue }
  }

  public var notes: GraphQLNullable<String> {
    get { __data["notes"] }
    set { __data["notes"] = newValue }
  }

  public var pocketState: GraphQLNullable<PocketStateCreateNestedOneWithoutVinylsInput> {
    get { __data["pocketState"] }
    set { __data["pocketState"] = newValue }
  }

  public var pressingLoc: GraphQLNullable<String> {
    get { __data["pressingLoc"] }
    set { __data["pressingLoc"] = newValue }
  }

  public var rank: GraphQLNullable<Int> {
    get { __data["rank"] }
    set { __data["rank"] = newValue }
  }

  public var readSpeed: ReadSpeedCreateNestedOneWithoutVinylsInput {
    get { __data["readSpeed"] }
    set { __data["readSpeed"] = newValue }
  }

  public var state: GraphQLNullable<StateCreateNestedOneWithoutVinylsInput> {
    get { __data["state"] }
    set { __data["state"] = newValue }
  }

  public var tracks: GraphQLNullable<TrackCreateNestedManyWithoutVinylInput> {
    get { __data["tracks"] }
    set { __data["tracks"] = newValue }
  }

  public var weight: GraphQLNullable<Int> {
    get { __data["weight"] }
    set { __data["weight"] = newValue }
  }
}
