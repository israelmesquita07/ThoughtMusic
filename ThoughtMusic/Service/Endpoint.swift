//
//  Endpoint.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

class Endpoint {
    private static let baseUrl:String = "https://us-central1-tw-exercicio-mobile.cloudfunctions.net/"
//    private var getSongsUrl = "\(baseUrl)lookup?id=<id>,<id>,<id>&limit=5"
    static var imageURL = "https://image.tmdb.org/t/p/w185"
    
    static func getSongs(ids:[Int]) -> String? {

        let mappedIds = ids.map { String($0) }
        let urlIds = mappedIds.compactMap{ $0 }.joined(separator: ",")
        let url = "\(baseUrl)lookup?id=\(urlIds)&limit=5"
        return url
    }
}
