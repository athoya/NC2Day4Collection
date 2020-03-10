//
//  ViewController.swift
//  NC2Day4Collection
//
//  Created by Jazilul Athoya on 10/03/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    
    // 1 mentor: create array to shuffle
    var titleArray: [String] = ["Song number 1", "Song number 2", "Song number 3"]
    
    // x practice: create duration for the songs, anggep aja minute
    var durationArray: [Int] = [4, 3, 6]
    
    // 5 create array of UIImage
    var imageArray: [UIImage] = [#imageLiteral(resourceName: "img_room"), #imageLiteral(resourceName: "img_building"), #imageLiteral(resourceName: "img_coffee")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 2 how can we get random element for the list
    @IBAction func shuffleSong(_ sender: UIButton) {
        // 3 explain random, range and how to get the count of the array
        let randomIndex = Int.random(in: 0..<titleArray.count)
        // explain how to access the array
        titleLabel.text = titleArray[randomIndex]
        
        // 4 practice: create array for shuffle the image, get access to it
        coverImage.image = imageArray[randomIndex]
    }
    
}

