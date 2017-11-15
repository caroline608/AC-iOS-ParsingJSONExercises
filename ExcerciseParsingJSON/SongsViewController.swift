//
//  ViewController.swift
//  ExcerciseParsingJSON
//
//  Created by Keshawn Swanston on 11/14/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var songs = [Songs]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "SecretSongs", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.songs = Songs.getSongs(from: data)
            }
        }
    }
    //   MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        cell.textLabel?.text = song.song_name
        cell.detailTextLabel?.text = song.display_artist
        return cell
    }


}

