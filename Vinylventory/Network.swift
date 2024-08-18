//
//  Network.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 13.08.2024.
//

import SwiftUI
import Apollo
import ApolloAPI
import VinylventoryAPI
import Alamofire

class Network {
    static let shared = Network()
    
    private var apolloClient: ApolloClient?
    private var currentURL: String?
    
    func apollo() -> ApolloClient {
        let url = UserDefaults.standard.string(forKey: "url")!

        if apolloClient == nil || url != currentURL {
            let sclient = URLSessionClient()
            let cache = InMemoryNormalizedCache()
            let store = ApolloStore(cache: cache)
            let provider = NetworkInterceptorProvider(client: sclient, store: store)
            let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: URL(string: "\(url)/graphql")!)
            let client = ApolloClient(networkTransport: transport, store: store)
            
            self.apolloClient = client
            self.currentURL = url
        }
        
        return apolloClient!
    }
    
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
        apollo().fetch(query: GetVinylsQuery()) { result in
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
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        apollo().perform(mutation: CreateVinylMutation(
            catNumber: cartNumber,
            dateReleased: dateReleased == "null" ? .none : .some(dateReleased),
            dateEdited: dateEdited == "null" ? .none : .some(dateEdited),
            notePocket: notePocket.isEmpty ? .none : .some(notePocket),
            pressingLoc: pressingLoc.isEmpty ? .none : .some(pressingLoc),
            edition: edition.isEmpty ? .none : .some(edition),
            weight: weight == 0 ? .none : .some(weight),
            rank: rank == 0 ? .none : .some(rank),
            notes: notes.isEmpty ? .none : .some(notes),
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
                    note: credit.note.isEmpty ? .none : .some(credit.note),
                    role: credit.role.isEmpty ? .none : .some(credit.role)
                )
            }),
            album: album.isEmpty ? .none : .some(AlbumCreateNestedOneWithoutVinylsInput(
                connectOrCreate: .some(AlbumCreateOrConnectWithoutVinylsInput(
                    create: AlbumCreateWithoutVinylsInput(
                        name: album
                    ),
                    where: AlbumWhereUniqueInput(
                        name: .some(album)
                    ))
                )
            )),
            label: label.isEmpty ? .none : .some(LabelCreateNestedOneWithoutVinylsInput(
                connectOrCreate: .some(LabelCreateOrConnectWithoutVinylsInput(
                    create: LabelCreateWithoutVinylsInput(
                        name: label
                    ),
                    where: LabelWhereUniqueInput(
                        name: .some(label)
                    ))
                )
            )),
            tracks: tracks.map { track in
                TrackCreateManyVinylInput(duration: .some(track.duration), name: track.name)
            },
            bought: locBought.isEmpty && dateBought == "null" ? .none : .some(BoughtCreateNestedOneWithoutVinylsInput(
                connectOrCreate: .some(BoughtCreateOrConnectWithoutVinylsInput(
                    create: BoughtCreateWithoutVinylsInput(
                        date: dateBought,
                        loc: locBought,
                        note: noteBought.isEmpty ? .none : .some(noteBought),
                        price: priceBought == 0 ? .none : .some(priceBought)
                    ),
                    where: BoughtWhereUniqueInput(
                        locDate: .some(BoughtLocDateCompoundUniqueInput(
                            date: dateBought,
                            loc: locBought
                        ))
                    ))
                )
            )),
            pocketState: pocketState.isEmpty ? .none : .some(pocketState),
            state: state.isEmpty ? .none : .some(state),
            readSpeed: readSpeed.isEmpty ? .none : .some(readSpeed)
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
    
    struct DecodableType: Decodable { let id: String }
    
    func uploadImage(_ image: UIImage, idVinyl: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(String(describing: UserDefaults.standard.string(forKey: "url")))/upload"

        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(idVinyl.utf8), withName: "idVinyl")
            
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
            }
        }, to: url, method: .post, headers: [.accept("application/json"), .authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)])
        .validate()
        .responseDecodable(of: DecodableType.self) { response in
            DispatchQueue.main.async {
                completion(.success(response.value!.id))
            }
        }
    }
    
    
    func fetchArtists(completion: @escaping (Result<[GetArtistsQuery.Data.Artist], Error>) -> Void) {
        apollo().fetch(query: GetArtistsQuery()) { result in
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
        apollo().fetch(query: GetPocketStatesQuery()) { result in
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
        apollo().fetch(query: GetStatesQuery()) { result in
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
        apollo().fetch(query: GetReadSpeedQuery()) { result in
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

class AuthorizationInterceptor: ApolloInterceptor {
    public var id: String = UUID().uuidString
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        if let token = UserDefaults.standard.string(forKey: "token") {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }

        chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self,
            completion: completion)
    }
    
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
    
}
