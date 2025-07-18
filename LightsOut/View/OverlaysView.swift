//
//  OverlaysView.swift
//  LightsOut
//
//  Created by Daniel Ian on 19/07/25.
//

import SwiftUI

struct MazeOverlayStack: View {
    @Binding var showOverlay: Bool
    @Binding var showPauseOverlay: Bool
    @Binding var showGameOverOverlay: Bool
    @Binding var navigateToHome: Bool
    var viewModel: MazeViewModel

    var body: some View {
        Group {
            if showOverlay {
                EndView(
                    restartAction: {
                        viewModel.generateMaze()
                        showOverlay = false
                    },
                    increaseSizeAction: {
                        viewModel.increaseMazeSize()
                        showOverlay = false
                    },
                    backToHomeAction: {
                        navigateToHome = true
                    }
                )
            }

            if showPauseOverlay {
                PauseOverlay(
                    restartAction: {
                        viewModel.generateMaze()
                        showPauseOverlay = false
                    },
                    backToHomeAction: {
                        navigateToHome = true
                    },
                    resumeAction: {
                        showPauseOverlay = false
                    }
                )
            }

            if showGameOverOverlay {
                GameOverView(
                    score: viewModel.score,
                    backToHomeAction: {
                        navigateToHome = true
                    }
                )
            }
        }
    }
}
