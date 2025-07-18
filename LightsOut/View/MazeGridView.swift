//
//  MazeGridView.swift
//  LightsOut
//
//  Created by Daniel Ian on 19/07/25.
//

import SwiftUI

struct MazeGridView: View {
    @ObservedObject var viewModel: MazeViewModel
    var sizeClass: UserInterfaceSizeClass?

    var body: some View {
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
        .padding()
    }
}
