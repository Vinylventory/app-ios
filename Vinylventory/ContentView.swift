//
//  ContentView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .padding(.top, 40)
                
                Text("Vinylventory")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 20) {
                    NavigationLink(destination: ListView()) {
                        ButtonView(iconName: "list.bullet")
                    }
                    NavigationLink(destination: AddView()) {
                        ButtonView(iconName: "plus")
                    }
                }
                .padding(.horizontal)
                
                HStack(spacing: 20) {
                    ButtonView(iconName: "square.slash", disabled: true)
                    NavigationLink(destination: SettingsView()) {
                        ButtonView(iconName: "gear")
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom)
        }
    }
}

struct ButtonView: View {
    var iconName: String
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(disabled ? Color.gray : Color.blue)
                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2 - 30)
            
            Image(systemName: iconName)
                .font(.system(size: 50))
                .foregroundColor(.white)
        }
        .opacity(disabled ? 0.5 : 1.0)
    }
}

#Preview {
    ContentView()
}
