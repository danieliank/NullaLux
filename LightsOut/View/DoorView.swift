//
//  DoorView.swift
//  LightsOut
//
//  Created by Daniel Ian on 21/02/25.
//

import SwiftUI

struct DoorView: View {
    var isOpen: Bool

    var body: some View {
        Image(isOpen ? "DoorOpen" : "DoorClose")
            .resizable()
            .scaleEffect(0.25)
            .frame(width: 80, height: 102)
    }
}
