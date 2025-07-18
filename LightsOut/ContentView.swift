//
//  ContentView.swift
//  LightsOut
//
//  Created by Daniel Ian on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            ZStack{
                Rectangle().foregroundStyle(.black)
                PlayerView(direction: .down)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
