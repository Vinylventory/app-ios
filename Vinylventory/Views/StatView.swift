//
//  StatView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 04.09.2024.
//

import SwiftUI
import SwiftData
import Charts

struct StatView: View {
    
    @Binding var path: NavigationPath
    
    @Query private var vinyls: [Vinyl]
    @Query private var artists: [Artist]
    
    private var totalVinylCount: Int {
        vinyls.count
    }
    
    private var totalWeight: Float {
        vinyls.reduce(0) { $0 + $1.weight }
    }
    
    private var rankCounts: [String: Int] {
        Dictionary(grouping: vinyls, by: { "Rank \($0.rank)" })
            .mapValues { $0.count }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Basic Stats")) {
                HStack {
                    Text("Number of vinyls")
                    Spacer()
                    Text("\(totalVinylCount)")
                }
                HStack {
                    Text("Total vinyl weight:")
                    Spacer()
                    Text("\(totalWeight, specifier: "%.2f") g")
                }
                HStack {
                    Text("Number of artists")
                    Spacer()
                    Text("\(artists.count)")
                }
            }
            
            Section(header: Text("Charts")) {
                PieChartView(rankCounts: rankCounts)
                    .frame(height: 300)
            }
        }
        .navigationBarTitle("Statistics", displayMode: .large)
    }
}

struct PieChartView: View {
    let rankCounts: [String: Int]
    
    var body: some View {
        Chart {
            ForEach(rankCounts.sorted(by: { $0.key < $1.key }), id: \.key) { rank, count in
                SectorMark(
                    angle: .value("Count", Double(count)),
                    innerRadius: .ratio(0.5)
                )
                .foregroundStyle(by: .value("Rank", rank))
            }
        }
        .padding()
    }
}
