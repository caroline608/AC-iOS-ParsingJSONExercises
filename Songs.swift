//
//  Songs.swift
//  ExcerciseParsingJSON
//
//  Created by Keshawn Swanston on 11/14/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import Foundation

class Songs {
    let song_name: String
    let display_artist: String
    init(song_name: String, display_artist: String) {
        self.display_artist = display_artist
        self.song_name = song_name
    }
    convenience init?(from dict: [String : Any]) {
        let display_artist = dict["display_artist"] as? String ?? "Unknown Artist"
        guard let song_name = dict["song_name"] as? String else {return nil}
        self.init(song_name: song_name, display_artist: display_artist)
        
    }
    static func getSongs(from data: Data) -> [Songs] {
        var songs = [Songs]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = json as? [[String : Any]] else { return [] }
            for songDict in jsonDict {
                if let newSong = Songs(from: songDict) {
                    songs.append(newSong)
                }
            }
        }
        catch {
            print("\(error)")
        }
        return songs
    }
}
