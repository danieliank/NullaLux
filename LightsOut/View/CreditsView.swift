//
//  CreditsView.swift
//  LightsOut
//
//  Created by Daniel Ian on 23/02/25.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 30) {
                Text("Credits")
                    .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 36 : 52, weight: .bold))
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 12 : 20) {
                    Text("Maze Generation")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                    
                    Text("The maze generation in this game is based on Prim's Algorithm.")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                    
                    Link("Jamis Buck - Maze Generation: Prim's Algorithm", destination: URL(string: "https://weblog.jamisbuck.org/2011/1/10/maze-generation-prim-s-algorithm")!)
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                        .foregroundColor(.blue)
                }
                
                Divider().background(Color.white)
                
                VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 12 : 20) {
                    Text("Game Assets")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                    
                    Text("Character, tiles, key, and door assets used in this game are from a free 1-bit sci-fi platformer pixel art kit.")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                    
                    Link("CraftPix - Free Sci-Fi Platformer 1-Bit Pixel Art Game Kit", destination: URL(string: "https://craftpix.net/freebies/free-sci-fi-platformer-1-bit-pixel-art-game-kit/")!)
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                        .foregroundColor(.blue)
                }
                
                Divider().background(Color.white)
                
                VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 12 : 20) {
                    Text("Arrow Asset")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                    
                    Text("The arrow icon used in this game is sourced from Flaticon.")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                    
                    Link("Flaticon - Pointer Icon", destination: URL(string: "https://www.flaticon.com/free-icon/pointer_2885974?related_id=2885974&origin=pack")!)
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                        .foregroundColor(.blue)
                }
                
                Divider().background(Color.white)
                
                VStack(alignment: .leading, spacing: DeviceUtils.isPhone(sizeClass: sizeClass) ? 12 : 20) {
                    Text("Shake Animation")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 24 : 40, weight: .bold))
                    
                    Text("The shake animation used in this game is based on the SwiftUI shake animation technique.")
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                    
                    Link("Objc.io - SwiftUI Shake Animation", destination: URL(string: "https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/")!)
                        .font(.system(size: DeviceUtils.isPhone(sizeClass: sizeClass) ? 16 : 30))
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding(.horizontal, DeviceUtils.isPhone(sizeClass: sizeClass) ? 20 : 40)
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
