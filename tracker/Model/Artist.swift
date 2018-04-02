//
//  Artist.swift
//  tracker
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

class Artist{
    var name: String
    var place: String?
    
    
    init?(name: String,place: String?) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.place = place
    }
}
