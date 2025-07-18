import SwiftUI

struct MazeView: View {
    @StateObject private var viewModel: MazeViewModel
    @State private var showOverlay = false
    @State private var showPauseOverlay = false
    @State private var navigateToHome = false
    @State private var showGameOverOverlay = false
    @Environment(\.horizontalSizeClass) private var sizeClass

    init() {
        _viewModel = StateObject(wrappedValue: MazeViewModel(width: 7, height: 7, sizeClass: nil))
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.black.ignoresSafeArea()
                CountdownBar(reset: $viewModel.resetCountdown) {
                    AudioManager.shared.playSound(.exit)
                    showGameOverOverlay = true
                }
                .ignoresSafeArea(edges: .top)

                VStack {
                    MazeHeaderView(viewModel: viewModel, showGameOverOverlay: $showGameOverOverlay)
                    Spacer()
                    MazeGridView(viewModel: viewModel, sizeClass: sizeClass)
                    Spacer()
                    MazeControlsView(viewModel: viewModel, sizeClass: sizeClass)
                }
                .onAppear {
                    viewModel.horizontalSizeClass = sizeClass
                    viewModel.generateMaze()
                }

                MazeOverlayStack(
                    showOverlay: $showOverlay,
                    showPauseOverlay: $showPauseOverlay,
                    showGameOverOverlay: $showGameOverOverlay,
                    navigateToHome: $navigateToHome,
                    viewModel: viewModel
                )

                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $navigateToHome) {
                    EmptyView()
                }
            }
        }
        .onChange(of: viewModel.navigateToEnd) { newValue in
            if newValue {
                showOverlay = true
                viewModel.navigateToEnd = false
            }
        }
    }
}
#Preview {
    MazeView()
}
