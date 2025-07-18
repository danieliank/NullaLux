//
//  HomeView.swift
//  LightsOut
//
//  Created by Daniel Ian on 22/02/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isVisible = false
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("LightsOut")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 148, weight: .bold))
                        .foregroundStyle(.white)
                        .opacity(isVisible ? 1 : 0.2)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                isVisible.toggle()
                            }
                        }
                        .padding(.horizontal)

                    Spacer()
                    NavigationLink(destination: GameStoryView()
                        .navigationBarBackButtonHidden(true)) {
                            Image(systemName: "play.fill")
                                .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 40 : 100, weight: .bold))
                                .frame(width: DeviceUtils.isPhone(sizeClass: sizeClass) ? 200 : 600, height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 80 : 150)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(12)
                    }
                    Spacer().frame(height: DeviceUtils.isPhone(sizeClass: sizeClass) ? 60 : 160)
                    NavigationLink(destination: HowtoView()) {
                        Text("How To Play")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 60, weight: .bold))
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: CreditsView()) {
                        Text("Credits")
                            .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 60, weight: .bold))
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
