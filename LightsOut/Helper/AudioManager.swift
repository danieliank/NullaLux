//
//  AudioManager.swift
//  LightsOut
//
//  Created by Daniel Ian on 18/07/25.
//


import AVFoundation

class AudioManager {
    static let shared = AudioManager()

    private var audioPlayers: [String: AVAudioPlayer] = [:]

    enum Sound: String {
        case move = "move.mp3"
        case pickup = "pickup.mp3"
        case shake = "shake.mp3"
        case exit = "exit.mp3"
    }

    func playSound(_ sound: Sound) {
        let filename = sound.rawValue

        if let player = audioPlayers[filename], player.isPlaying == false {
            player.currentTime = 0
            player.play()
        } else {
            guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
                print("Audio file \(filename) not found.")
                return
            }

            do {
                let player = try AVAudioPlayer(contentsOf: url)
                audioPlayers[filename] = player
                player.play()
            } catch {
                print("Failed to load sound: \(error)")
            }
        }
    }
}
