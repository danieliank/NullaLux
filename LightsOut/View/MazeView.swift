import SwiftUI

struct MazeView: View {
    @StateObject private var viewModel: MazeViewModel
    @State private var showOverlay = false
    @State private var showPauseOverlay = false
    @State private var navigateToHome = false
    @Environment(\.horizontalSizeClass) private var sizeClass

    init() {
        _viewModel = StateObject(wrappedValue: MazeViewModel(width: 7, height: 7, sizeClass: nil))
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        Button(action: { showPauseOverlay = true }) {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 28 : 42,
                                       height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 32 : 48)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    GridStack(rows: viewModel.height, cols: viewModel.width) { row, col in
                        ZStack {
                            viewModel.getViewForCell(row: row, col: col)
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 60,
                                       height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 60)

                            if Point(x: col, y: row) == viewModel.itemLocation && !viewModel.itemCollected {
                                viewModel.getItem()
                                    .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 60,
                                           height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 60)
                            }
                        }
                    }
                    .modifier(ShakeEffect(animatableData: CGFloat(viewModel.shakeTrigger)))
                    .border(Color.black, width: 2)
                    Spacer()

                    HStack {
                        Button(action: { viewModel.movePlayer(direction: .left) }) {
                            Image("Arrow")
                                .resizable()
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120,
                                       height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120)
                                .rotationEffect(.degrees(180))
                        }
                        VStack {
                            Button(action: { viewModel.movePlayer(direction: .up) }) {
                                Image("Arrow")
                                    .resizable()
                                    .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120,
                                           height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120)
                                    .rotationEffect(.degrees(-90))
                            }
                            Button(action: { viewModel.movePlayer(direction: .down) }) {
                                Image("Arrow")
                                    .resizable()
                                    .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120,
                                           height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120)
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        Button(action: { viewModel.movePlayer(direction: .right) }) {
                            Image("Arrow")
                                .resizable()
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120,
                                       height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 120)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    viewModel.horizontalSizeClass = sizeClass
                    viewModel.generateMaze()
                }

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
