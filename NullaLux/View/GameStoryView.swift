//
//  GameStoryView.swift
//  LightsOut
//
//  Created by Daniel Ian on 23/02/25.
//

import SwiftUI

struct GameStoryView: View {
    @State private var textIndex = 0
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    private let storyTexts = [
        "You wake up in a dark, eerie maze. The only source of light comes from a mysterious golden key lying ahead...",
        "A whisper echoes in the darkness: 'This key opens the exit, but be warned… once you take it, the light will vanish, and so will the walls.'",
        "You realize you must memorize the maze before picking up the key. Every turn, every dead end, your mind is now your map.",
        "The key feels warm in your hands. Suddenly, the world turns pitch black. The walls that once guided you are gone.",
        "Only silence remains. The exit door is somewhere in this void… and you must find it before it's too late."
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    Text(storyTexts[textIndex])
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(maxWidth: DeviceUtils.isPhone(sizeClass: sizeClass) ? 350 : 700)
                        .transition(.opacity)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    if textIndex < 2 {
                        PlayerView()
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 2 : 3)
                            .transition(.scale)
                    } else if textIndex < 4 {
                        ItemView()
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 3 : 4)
                            .transition(.scale)
                    } else {
                        Image("DoorOpen")
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 1.5 : 2)
                            .transition(.scale)
                    }
                    
                    Spacer()
                    
                    if textIndex < storyTexts.count - 1 {
                        Button(action: {
                            withAnimation {
                                textIndex += 1
                            }
                        }) {
                            Text("Next")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40, weight: .bold))
                                .padding()
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 200 : 300)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 50)
                    } else {
                        NavigationLink(destination: MazeView().navigationBarBackButtonHidden(true)) {
                            Text("Begin")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40, weight: .bold))
                                .padding()
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 200 : 300)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, DeviceUtils.isPhone(sizeClass: sizeClass) ? 30 : 50)
                    }
                }
            }
        }
    }
}
