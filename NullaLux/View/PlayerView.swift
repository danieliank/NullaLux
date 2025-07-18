//
//  PlayerView.swift
//  LightsOut
//
//  Created by Daniel Ian on 21/02/25.
//

import SwiftUI

struct PlayerView: View {
    let direction: Direction
    
    @State private var currentFrame = 0
    private let frameCount = 8
    private let frameSize = CGSize(width: 80, height: 135)
    
    private var spriteSheet: UIImage {
        switch direction {
        case .up:
            return UIImage(named: "CharUp")!
        case .down:
            return UIImage(named: "CharDown")!
        case .left:
            return UIImage(named: "CharLeft")!
        case .right:
            return UIImage(named: "CharRight")!
        }
    }

    var body: some View {
        TimelineView(.animation) { context in
            Image(uiImage: cropFrame(index: currentFrame))
                .resizable()
                .scaleEffect(0.25)
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
        Timer.scheduledTimer(withTimeInterval: 0.125, repeats: true) { _ in
            DispatchQueue.main.async {
                currentFrame = (currentFrame + 1) % frameCount
            }
        }
    }
}
