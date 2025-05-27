//
//  HowtoView.swift
//  LightsOut
//
//  Created by Daniel Ian on 23/02/25.
//

import SwiftUI

struct HowtoView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 30) {
                Text("How To Play")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 36 : 52, weight: .bold))
                    .padding(.top)

                HStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20) {
                    ZStack {
                        Rectangle()
                            .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80,
                                   height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80)
                            .foregroundStyle(.black)
                        PlayerView()
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 2 : 3)
                    }
                    
                    VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 5 : 10) {
                        Text("Character")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                        Text("You control this character. Navigate through the maze to reach the door.")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                    }
                }

                Divider().background(Color.white)

                HStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20) {
                    ZStack {
                        Rectangle()
                            .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80,
                                   height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80)
                            .foregroundStyle(.black)
                        ItemView()
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 3 : 4)
                    }

                    VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 6 : 12) {
                        Text("Key")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                        Text("The key is the light source. Once picked up, the lights go out, and the walls disappear. Memorize the maze layout before taking it!")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                    }
                }

                Divider().background(Color.white)

                HStack(spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20) {
                    ZStack {
                        Rectangle()
                            .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80,
                                   height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 80)
                            .foregroundStyle(.black)
                        Image("DoorClose")
                            .scaleEffect(DeviceUtils.isPhone(sizeClass: sizeClass) ? 1.5 : 2)
                    }
                    VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 5 : 10) {
                        Text("Door")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))

                        Text("This is your final goal! Reach the door after collecting the key to win the game.")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                    }
                }

                Divider().background(Color.white)

                VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20) {
                    Label("Game Strategy & Tips", systemImage: "brain.head.profile")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 44, weight: .bold))
                        .padding(.top)
                    
                    Group {
                        HStack(alignment: .top) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                            Text("Explore and memorize the maze layout before picking up the key.")
                        }
                        
                        HStack(alignment: .top) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                            Text("Plan your route carefully! Once the walls disappear, it's easy to get lost!")
                        }
                        
                        HStack(alignment: .top) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                            Text("If stuck, visualize the maze layout in your mind before moving.")
                        }
                        
                        HStack(alignment: .top) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                            Text("The more you play, the harder the levels become, with larger mazes and more possibilities.")
                        }
                        
                        HStack(alignment: .top) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                            Text("The game challenges your spatial knowledge and memory. Keep practicing!")
                        }
                    }
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 32))
                }
                .padding(.horizontal, DeviceUtils.isPhone(sizeClass: sizeClass) ? 10 : 20)

                Spacer()
            }
            .padding(.horizontal, DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
