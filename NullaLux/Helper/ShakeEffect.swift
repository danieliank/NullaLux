//
//  ShakeEffect.swift
//  LightsOut
//
//  Created by Daniel Ian on 23/02/25.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: sin(animatableData * .pi * 2) * 10, y: 0))
    }
}
