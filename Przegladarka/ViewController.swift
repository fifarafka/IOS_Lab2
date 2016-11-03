//
//  ViewController.swift
//  Przegladarka
//
//  Created by Użytkownik Gość on 13.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var albums: NSMutableArray?
    var iterator = 0
    
    @IBOutlet weak var artist: UITextField!
    
    @IBOutlet weak var title2: UITextField!
    
    @IBOutlet weak var game: UITextField!
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var rating: UILabel!

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var stepperButton: UIStepper!

    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albums = SharedAlbums.sharedInstance.albums!
        if (iterator != albums?.count) {
            loadData();
        } else {
            emptyForm()
        }
        saveButton.enabled = false
        cancelButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func onDelete(sender: AnyObject) {
        albums!.removeObjectAtIndex(iterator)
        navigationController?.popViewControllerAnimated(true)
    }

    
    @IBAction func onArtistEditting(sender: AnyObject) {
        saveButton.enabled = true
    }
    
    @IBAction func onTitleEditting(sender: AnyObject) {
        saveButton.enabled = true
    }

    @IBAction func onGenreEditting(sender: AnyObject) {
        saveButton.enabled = true
    }
    
    @IBAction func onYearEditting(sender: AnyObject) {
        saveButton.enabled = true
    }
    
    @IBAction func onStepperAction(sender: AnyObject) {
        rating.text = String(Int(stepperButton.value))
        saveButton.enabled = true
    }
    @IBAction func onSave(sender: AnyObject) {
        if (iterator != albums?.count) {
            updateOldAlbum()
        } else {
            newAlbum()
            deleteButton.enabled = true
            navigationController?.popViewControllerAnimated(true)
            
        }
        saveButton.enabled = false
    }
    
    func updateOldAlbum() {
        var optArtist: String?
        optArtist = artist.text!
        albums!.objectAtIndex(iterator).setValue(optArtist, forKey: "artist")
        var optTitle: String?
        optTitle = title2.text!
        albums!.objectAtIndex(iterator).setValue(optTitle, forKey: "title")
        var optGenre: String?
        optGenre = game.text!
        albums!.objectAtIndex(iterator).setValue(optGenre, forKey: "genre")
        var optYear: String?
        optYear = year.text!
        albums!.objectAtIndex(iterator).setValue(optYear, forKey: "date")
        var optRating: String?
        optRating = rating.text!
        albums!.objectAtIndex(iterator).setValue(optRating, forKey: "rating")
    }
    
    func newAlbum() {
        let album = NSMutableDictionary()
        album.setObject(artist.text!, forKey: "artist")
        album.setObject(game.text!, forKey: "genre")
        album.setObject(year.text!, forKey: "date")
        album.setObject(title2.text!, forKey: "title")
        album.setObject(rating.text!, forKey: "rating")
        albums!.addObject(album)
    }
    
    func emptyForm() {
        artist.text = nil
        title2.text = nil
        game.text = nil
        year.text = nil
        rating.text = "0"
        stepperButton.value = 0.0
    }
    
    func loadData() {
        let artistValue = albums!.objectAtIndex(iterator).objectForKey("artist")
        artist.text = "\(artistValue!)"
        let titleValue = albums!.objectAtIndex(iterator).objectForKey("title")
        title2.text = "\(titleValue!)"
        let gameValue = albums!.objectAtIndex(iterator).objectForKey("genre")
        game.text = "\(gameValue!)"
        let yearValue = albums!.objectAtIndex(iterator).objectForKey("date")
        year.text = "\(yearValue!)"
        let ratingValue = albums!.objectAtIndex(iterator).objectForKey("rating")
        rating.text = "\(ratingValue!)"
        stepperButton.value = Double(rating.text!)!
    }
    
}

