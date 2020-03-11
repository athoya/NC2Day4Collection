//
//  ViewController.swift
//  NC2Day4Collection
//
//  Created by Jazilul Athoya on 10/03/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    
    // create temporary variable to bind data for next view controller
    var titleMusic = ""
    var imageMusic: UIImage?
    var descMusic = ""
    
    // 1 mentor: create array to shuffle
    var titleArray: [String] = ["Song number 1", "Song number 2", "Song number 3"]
    
    // x practice: create duration for the songs, anggep aja minute
    var descArray: [String] = ["Description 1", "Description 2", "Description 3"]
    
    // 5 create array of UIImage
    var imageArray: [UIImage] = [#imageLiteral(resourceName: "img_room"), #imageLiteral(resourceName: "img_building"), #imageLiteral(resourceName: "img_coffee")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultData()
    }
    
    // Set default value to our music player
    func setDefaultData() {
        // explain how to access the array
        titleLabel.text = titleArray[0]
        titleMusic = titleArray[0]
        
        // 4 practice: create array for shuffle the image, get access to it
        coverImage.image = imageArray[0]
        imageMusic = imageArray[0]
    }
    
    // 2 how can we get random element for the list
    @IBAction func shuffleSong(_ sender: UIButton) {
        // 3 explain random, range and how to get the count of the array
        let randomIndex = Int.random(in: 0..<titleArray.count)
        // explain how to access the array
        titleLabel.text = titleArray[randomIndex]
        titleMusic = titleArray[randomIndex]
        
        // 4 practice: create array for shuffle the image, get access to it
        coverImage.image = imageArray[randomIndex]
        imageMusic = imageArray[randomIndex]
        
        descLabel.text = descArray[randomIndex]
    }
    
    @IBAction func unwindBackFromSearch(segue: UIStoryboardSegue) {
        titleLabel.text = titleMusic
        coverImage.image = imageMusic
        descLabel.text = descMusic
    }
    
    // 3 Send current music info to detail view
    @IBAction func toDetailSong(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetailVC", sender: self)
    }

    // 4 Prepare the data to send between controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationView = segue.destination as? DetailViewController {
            destinationView.musicTitle = titleMusic
            destinationView.musicImage = imageMusic
        }
        if let destinationView = segue.destination as? SearchViewController {
            destinationView.musicArray = self.titleArray
            destinationView.musicCoverAlbumArray = self.imageArray
            destinationView.musicDescArray = self.descArray
        }
    }
    
}

