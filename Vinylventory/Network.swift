//
//  Network.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 13.08.2024.
//

import Foundation
import Apollo
import VinylventoryAPI

class Network {
    static let shared = Network()
    var apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
    
    struct Artist: Identifiable {
        var id: UUID = UUID()
        var surname: String
        var name: String
        var origin: String
    }
    
    struct Credit: Identifiable {
        var id: UUID = UUID()
        var role: String
        var note: String
        var artist: Artist
    }
    
    struct Track: Identifiable {
        var id: UUID = UUID()
        var name: String
        var duration: Int
        
    }
    
    func fetchVinyls(completion: @escaping (Result<[GetVinylsQuery.Data.Vinyl], Error>) -> Void) {
        apollo.fetch(query: GetVinylsQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let vinyls = graphQLResult.data?.vinyls {
                        DispatchQueue.main.async {
                            completion(.success(vinyls))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    func createVinyl(
        cartNumber: String,
        dateReleased: String,
        dateEdited: String,
        notePocket: String,
        pressingLoc: String,
        edition: String,
        weight: Int,
        rank: Int,
        notes: String,
        playedBys: [Artist],
        authoreds: [Artist],
        credits: [Credit],
        album: String,
        label: String,
        tracks: [Track],
        locBought: String,
        dateBought: String,
        priceBought: Int,
        noteBought: String,
        pocketState: String,
        state: String,
        readSpeed: String,
        images: [String],
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        apollo.perform(mutation: CreateVinylMutation(
            catNumber: cartNumber,
            dateReleased: .some(dateReleased),
            dateEdited: .some(dateEdited),
            notePocket: .some(notePocket),
            pressingLoc: .some(pressingLoc),
            edition: .some(edition),
            weight: .some(weight),
            rank: .some(rank),
            notes: .some(notes),
            playedBys: .some(playedBys.map { playedBy in
                PlayedByCreateWithoutVinylInput(
                    artist: ArtistCreateNestedOneWithoutPlayedByInput(
                        connectOrCreate: .some(ArtistCreateOrConnectWithoutPlayedByInput(
                            create: ArtistCreateWithoutPlayedByInput(
                                name: playedBy.name,
                                origin: playedBy.origin,
                                surname: .some(playedBy.surname)
                            ),
                            where: ArtistWhereUniqueInput(
                                surnameNameOrigin: .some(ArtistSurnameNameOriginCompoundUniqueInput(
                                    name: playedBy.name,
                                    origin: playedBy.origin,
                                    surname: playedBy.surname
                                )
                            ))
                        )
                    ))
                )
            }),
            authoreds: .some(authoreds.map { authored in
                AuthoredCreateWithoutVinylInput(
                    artist: ArtistCreateNestedOneWithoutAuthoredInput(
                        connectOrCreate: .some(ArtistCreateOrConnectWithoutAuthoredInput(
                            create: ArtistCreateWithoutAuthoredInput(
                                name: authored.name,
                                origin: authored.origin,
                                surname: .some(authored.surname)
                            ),
                            where: ArtistWhereUniqueInput(
                                surnameNameOrigin: .some(ArtistSurnameNameOriginCompoundUniqueInput(
                                    name: authored.name,
                                    origin: authored.origin,
                                    surname: authored.surname
                                )
                            ))
                        )
                    ))
                )
            }),
            credits: .some(credits.map { credit in
                CreditCreateWithoutVinylInput(
                    artist: ArtistCreateNestedOneWithoutCreditsInput(
                        connectOrCreate: .some(ArtistCreateOrConnectWithoutCreditsInput(
                            create: ArtistCreateWithoutCreditsInput(
                                name: credit.artist.name,
                                origin: credit.artist.origin,
                                surname: .some(credit.artist.surname)
                            ),
                            where: ArtistWhereUniqueInput(
                                surnameNameOrigin: .some(ArtistSurnameNameOriginCompoundUniqueInput(
                                    name: credit.artist.name,
                                    origin: credit.artist.origin,
                                    surname: credit.artist.surname
                                )
                            ))
                        )
                    )),
                    note: .some(credit.note),
                    role: .some(credit.role)
                )
            }),
            album: album,
            label: label,
            tracks: tracks.map { track in
                TrackCreateManyVinylInput(duration: .some(track.duration), name: track.name)
            },
            boughtLoc: locBought,
            boughtDate: dateBought,
            boughtPrice: .some(priceBought),
            boughtNote: .some(noteBought),
            pocketState: .some(pocketState),
            state: .some(state),
            readSpeed: .some(readSpeed),
            images: .some(images.map { imageId in
                ImageWhereUniqueInput(idImage: .some(imageId))
            })
        )) { result in
            switch result {
                case .success(let graphQLResult):
                    if let idVinyl = graphQLResult.data?.createOneVinyl.idVinyl {
                        DispatchQueue.main.async {
                            completion(.success(idVinyl))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    func fetchArtists(completion: @escaping (Result<[GetArtistsQuery.Data.Artist], Error>) -> Void) {
        apollo.fetch(query: GetArtistsQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let artists = graphQLResult.data?.artists {
                        DispatchQueue.main.async {
                            completion(.success(artists))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    func fetchPocketStates(completion: @escaping (Result<[GetPocketStatesQuery.Data.PocketState], Error>) -> Void) {
        apollo.fetch(query: GetPocketStatesQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let pocketStates = graphQLResult.data?.pocketStates {
                        DispatchQueue.main.async {
                            completion(.success(pocketStates))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    func fetchStates(completion: @escaping (Result<[GetStatesQuery.Data.State], Error>) -> Void) {
        apollo.fetch(query: GetStatesQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let states = graphQLResult.data?.states {
                        DispatchQueue.main.async {
                            completion(.success(states))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    func fetchReadSpeed(completion: @escaping (Result<[GetReadSpeedQuery.Data.ReadSpeed], Error>) -> Void) {
        apollo.fetch(query: GetReadSpeedQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let readSpeeds = graphQLResult.data?.readSpeeds {
                        DispatchQueue.main.async {
                            completion(.success(readSpeeds))
                        }
                    } else if let errors = graphQLResult.errors {
                        let errorDescription = errors.map { $0.localizedDescription }.joined(separator: "\n")
                        DispatchQueue.main.async {
                            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
}
