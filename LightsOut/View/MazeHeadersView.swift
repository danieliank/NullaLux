//
//  MazeHeadersView.swift
//  LightsOut
//
//  Created by Daniel Ian on 19/07/25.
//

import SwiftUI

struct MazeHeaderView: View {
    @ObservedObject var viewModel: MazeViewModel
    @Binding var showGameOverOverlay: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 300)
                Button(action: { showGameOverOverlay = true }) {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 32, height: 48)
                        .foregroundColor(.white)
                }
            }
            Text("Score: \(viewModel.score)")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
        }
    }
}
