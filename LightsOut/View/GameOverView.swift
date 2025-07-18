//
//  GameOverView.swift
//  LightsOut
//
//  Created by Daniel Ian on 18/07/25.
//

import SwiftUI

struct GameOverView: View {
    let score: Int                          // ✅ Add score here
    let backToHomeAction: () -> Void
    
    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 50) {
                Text("Time's Up!")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 32 : 70, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20)

                Text("The darkness overwhelmed you. But don’t worry, you can always try again!")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 18 : 35))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: DeviceUtils.isPhone(sizeClass: sizeClass) ? 300 : 700)

                // ✅ Show score
                Text("Score: \(score)")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 50))
                    .foregroundColor(.white)

                Button(action: backToHomeAction) {
                    Text("Back to Home")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 35, weight: .bold))
                        .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 200 : 300,
                               height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 90)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 30)
                        .shadow(radius: 5)
                }
            }
            .frame(
                width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 320 : 800,
                height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 400 : 600
            )
            .cornerRadius(DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
            .overlay(
                RoundedRectangle(cornerRadius: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
                    .stroke(Color.white.opacity(0.5), lineWidth: DeviceUtils.isPhone(sizeClass: sizeClass) ? 3 : 5)
            )
            .shadow(radius: DeviceUtils.isPhone(sizeClass: sizeClass) ? 5 : 10)
        }
    }
}
