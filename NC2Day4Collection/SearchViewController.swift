//
//  SearchViewController.swift
//  NC2Day4Collection
//
//  Created by zein rezky chandra on 10/03/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var musicDesc: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var imageMusic: UIImageView!
    @IBOutlet weak var resultView: UIView!
    
    // Boolean to flag when view result need to appear
    private var resultViewDisplayed = false
    
    // Temporary array to bind
    var musicArray = [String]()
    var musicCoverAlbumArray = [UIImage]()
    var musicDescArray = [String]()
    
    var songTitle = ""
    var songDesc = ""
    var songImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if resultViewDisplayed {
            resultView.isHidden = false
            musicTitle.text = songTitle
            musicDesc.text = songDesc
            imageMusic.image = songImage
        } else {
            resultView.isHidden = true
        }
    }
    
    // MARK: Search Func
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // make validation if character input more than 2, then we execute search process.
        if searchBar.text!.count > 2 {
            searchData(withKeyword: searchBar.text!)
        }
        searchBar.resignFirstResponder()
    }
        
    func searchData(withKeyword: String) {
        
        // Use conventional logic
        for (index, item) in musicArray.enumerated() {
            if item == withKeyword {
                resultViewDisplayed = true
                songTitle = item
                songImage = musicCoverAlbumArray[index]
                songDesc = musicDescArray[index]
                setupUI()
                break
            } else {
                resultViewDisplayed = false
                setupUI()
            }
        }
        
        // Create filter based on keyword
        // let filtered = arr.filter { $0.contains("lo") }
    }
    
    @IBAction func backToMain(_ sender: UIButton) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let previousVC = segue.destination as? ViewController {
            previousVC.titleMusic = songTitle
            previousVC.imageMusic = songImage
            previousVC.descMusic = songDesc
        }
    }
}
