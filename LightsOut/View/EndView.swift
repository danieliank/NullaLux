//
//  EndView.swift
//  LightsOut
//
//  Created by Daniel Ian on 22/02/25.
//

import SwiftUI

struct EndView: View {
    let restartAction: () -> Void
    let increaseSizeAction: () -> Void
    let backToHomeAction: () -> Void
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 50) {
                Text("You Found the Exit!")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 32 : 70, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20)
                    .multilineTextAlignment(.center)
                
                Text("Against the odds, you escaped the darkness. Your memory and problem-solving skills led you to the door. Are you ready for a greater challenge?")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 18 : 35))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: DeviceUtils.isPhone(sizeClass: sizeClass) ? 300 : 700)
                
                if DeviceUtils.isPhone(sizeClass: sizeClass) {
                    // Stack buttons vertically on iPhone
                    VStack(spacing: 20) {
                        Button(action: restartAction) {
                            Text("Restart")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 200, height: 60)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            increaseSizeAction()
                            restartAction()
                        }) {
                            Text("Next Level")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 200, height: 60)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                    }
                } else {
                    // Original horizontal layout for iPad
                    HStack(spacing: 50) {
                        Button(action: restartAction) {
                            Text("Restart")
                                .font(.system(size: 35, weight: .bold))
                                .frame(width: 300, height: 90)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            increaseSizeAction()
                            restartAction()
                        }) {
                            Text("Next Level")
                                .font(.system(size: 35, weight: .bold))
                                .frame(width: 300, height: 90)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                    }
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
