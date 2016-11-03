//
//  SharedAlbums.swift
//  Przegladarka
//
//  Created by Monika Wojtasik on 02.11.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import Foundation

class SharedAlbums {
    static let sharedInstance = SharedAlbums()
    private init() {}
    var albums: NSMutableArray?
}
