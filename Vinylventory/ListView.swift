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
    
    @State private var showingErrorAlert = false
    @State private var error = ""
    
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
        .alert(
            "Error fetching Vinyls",
            isPresented: $showingErrorAlert,
            presenting: error
        ) { error in
            Button(role: .destructive) {}
            label: {
                Text("\(error)")
            }
            Button("Retry") {
                Network.shared.fetchVinyls { result in
                    switch result {
                    case .success(let vinyls):
                        self.vinyls = vinyls
                    case .failure(let error):
                        print("Error fetching vinyls: \(error.localizedDescription)")
                        self.error = error.localizedDescription
                        showingErrorAlert = true
                    }
                }
            }
        }
        .onAppear {
            Network.shared.fetchVinyls { result in
                switch result {
                case .success(let vinyls):
                    self.vinyls = vinyls
                case .failure(let error):
                    print("Error fetching vinyls: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    showingErrorAlert = true
                }
            }
        }
        .refreshable {
            Network.shared.fetchVinyls { result in
                switch result {
                case .success(let vinyls):
                    self.vinyls = vinyls
                case .failure(let error):
                    print("Error fetching vinyls: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    showingErrorAlert = true
                }
            }
        }
    }
}

#Preview {
    ListView()
}
