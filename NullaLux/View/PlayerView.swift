//
//  PlayerView.swift
//  LightsOut
//
//  Created by Daniel Ian on 21/02/25.
//

import SwiftUI

struct PlayerView: View {
    let spriteSheet = UIImage(named: "Char")!
    let frameCount = 8
    let frameSize = CGSize(width: 48, height: 48)
    
    @State private var currentFrame = 0

    var body: some View {
        TimelineView(.animation) { context in
            Image(uiImage: cropFrame(index: currentFrame))
                .resizable()
                .frame(width: frameSize.width, height: frameSize.height)
                .onAppear {
                    startAnimation()
                }
        }
    }

    func cropFrame(index: Int) -> UIImage {
        let xOffset = CGFloat(index) * frameSize.width
        let cropRect = CGRect(x: xOffset, y: 0, width: frameSize.width, height: frameSize.height)
        let cgImage = spriteSheet.cgImage!.cropping(to: cropRect)!
        return UIImage(cgImage: cgImage)
    }

    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            DispatchQueue.main.async {
                currentFrame = (currentFrame + 1) % frameCount
            }
        }
    }
}
