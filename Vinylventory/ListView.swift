//
//  ListView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI
import VinylventoryAPI

struct ListView: View {
    
    @State var searchVinyl: String = ""
    
    @State private var vinyls: [GetVinylsQuery.Data.Vinyl] = []
    
    var body: some View {
        VStack {                
            List(vinyls, id: \.idVinyl) { vinyl in
                HStack {
                    Text(vinyl.catNumber)
                    Text(vinyl.idVinyl)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Vinyl list", displayMode: .large)
        .searchable(text: $searchVinyl, placement: .navigationBarDrawer(displayMode: .always))
        .onAppear {
            fetchVinyls { result in
                switch result {
                case .success(let vinyls):
                    self.vinyls = vinyls
                case .failure(let error):
                    print("Error fetching vinyls: \(error.localizedDescription)")
                }
            }
        }
        .refreshable {
            fetchVinyls { result in
                switch result {
                case .success(let vinyls):
                    self.vinyls = vinyls
                case .failure(let error):
                    print("Error fetching vinyls: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func fetchVinyls(completion: @escaping (Result<[GetVinylsQuery.Data.Vinyl], Error>) -> Void) {
        Network.shared.apollo.fetch(query: GetVinylsQuery()) { result in
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
}

#Preview {
    ListView()
}
