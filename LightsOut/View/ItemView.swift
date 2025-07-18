//
//  ItemView.swift
//  LightsOut
//
//  Created by Daniel Ian on 21/02/25.
//

import SwiftUI

struct ItemView: View {
    let spriteSheet = UIImage(named: "Key")!
    let frameCount = 6
    let frameSize = CGSize(width: 80, height: 129)
    
    @State private var currentFrame = 0

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
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            DispatchQueue.main.async {
                currentFrame = (currentFrame + 1) % frameCount
            }
        }
    }
}
