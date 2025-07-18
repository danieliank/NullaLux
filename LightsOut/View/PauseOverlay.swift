//
//  PauseOverlay.swift
//  LightsOut
//
//  Created by Daniel Ian on 18/07/25.
//

import SwiftUI

struct PauseOverlay: View {
    let restartAction: () -> Void
    let backToHomeAction: () -> Void
    let resumeAction: () -> Void
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).ignoresSafeArea()
            
            VStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 50) {
                Text("Game Paused")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 32 : 70, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20)
                    .multilineTextAlignment(.center)
                
                if DeviceUtils.isPhone(sizeClass: sizeClass) {
                    // Stack buttons vertically on iPhone
                    VStack(spacing: 20) {
                        Button(action: resumeAction) {
                            HStack {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 18, weight: .bold))
                                Text("Resume")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(width: 200, height: 60)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        
                        Button(action: restartAction) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                    .font(.system(size: 18, weight: .bold))
                                Text("Restart")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(width: 200, height: 60)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        
                        Button(action: backToHomeAction) {
                            HStack {
                                Image(systemName: "house.fill")
                                    .font(.system(size: 18, weight: .bold))
                                Text("Home")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(width: 200, height: 60)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                } else {
                    // Horizontal layout for iPad
                    VStack(spacing: 30) {
                        Button(action: resumeAction) {
                            HStack {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 30, weight: .bold))
                                Text("Resume")
                                    .font(.system(size: 35, weight: .bold))
                            }
                            .frame(width: 300, height: 90)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        
                        HStack(spacing: 50) {
                            Button(action: restartAction) {
                                HStack {
                                    Image(systemName: "arrow.clockwise")
                                        .font(.system(size: 30, weight: .bold))
                                    Text("Restart")
                                        .font(.system(size: 35, weight: .bold))
                                }
                                .frame(width: 300, height: 90)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            }
                            
                            Button(action: backToHomeAction) {
                                HStack {
                                    Image(systemName: "house.fill")
                                        .font(.system(size: 30, weight: .bold))
                                    Text("Home")
                                        .font(.system(size: 35, weight: .bold))
                                }
                                .frame(width: 300, height: 90)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            }
                        }
                    }
                }
            }
            .frame(
                width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 320 : 800,
                height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 450 : 600
            )
            .background(Color.black.opacity(0.9))
            .cornerRadius(DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
            .overlay(
                RoundedRectangle(cornerRadius: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
                    .stroke(Color.white.opacity(0.5), lineWidth: DeviceUtils.isPhone(sizeClass: sizeClass) ? 3 : 5)
            )
            .shadow(radius: DeviceUtils.isPhone(sizeClass: sizeClass) ? 5 : 10)
        }
    }
}
