//
//  AlbumsTableViewController.swift
//  Przegladarka
//
//  Created by Monika Wojtasik on 31.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

    var albums: NSMutableArray?
    
    let plistCatPath = NSBundle.mainBundle().pathForResource("albums", ofType: "plist")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SharedAlbums.sharedInstance.albums = NSMutableArray(contentsOfFile:plistCatPath!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albums = SharedAlbums.sharedInstance.albums!
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        albums = SharedAlbums.sharedInstance.albums
        tableView.reloadData()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        
        cell.textLabel?.text = albums![indexPath.row]["artist"] as? String
        cell.detailTextLabel?.text = albums![indexPath.row]["title"] as? String
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ViewController {
            if let cell = sender as? UITableViewCell {
                let selectedIndex = self.tableView.indexPathForCell(cell)
                vc.iterator = selectedIndex!.row
            } else {
                vc.iterator = (albums?.count)!
            }
        }
    }
}
