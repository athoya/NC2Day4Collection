//
//  DetailViewController.swift
//  NC2Day4Collection
//
//  Created by zein rezky chandra on 11/03/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    var musicTitle = ""
    var musicImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        // Introduce student, navigation controller title can be set dynamically
        self.title = musicTitle
        
        
        titleLabel.text = musicTitle
        if let coverImage = musicImage {
            imageDetail.image = coverImage
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
