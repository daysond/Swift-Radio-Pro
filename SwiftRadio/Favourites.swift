//
//  Favourites.swift
//  SwiftRadio
//
//  Created by Dayson Dong on 2019-06-13.
//  Copyright © 2019 matthewfecher.com. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class FavTrack: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var artist = ""
    
}

class StationName: Object {
    
    @objc dynamic var stationID = UUID().uuidString
    @objc dynamic var name = ""
    let favTracks = List<FavTrack>()
    
    override static func primaryKey() -> String? {
        return "stationID"
    }
    
}
