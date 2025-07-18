//
//  MazeControlsView.swift
//  LightsOut
//
//  Created by Daniel Ian on 19/07/25.
//

import SwiftUI

struct MazeControlsView: View {
    let viewModel: MazeViewModel
    var sizeClass: UserInterfaceSizeClass?

    var body: some View {
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
}
