//
//  Playlist.swift
//  ThoughtMusic
//
//  Created by Israel on 23/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

struct Result: Codable {
    let results: [Song]?
}

struct Song: Codable {
    
    let id: Int?
    let wrapperType: String?
    let trackName: String?
    let primaryGenreName: String?
    let artworkUrl: String?
    let collectionId: Int?
    let collectionName: String?
    let artistId: Int?
    let artistName: String?
}




//"id":779273550,
//"collectionId":879273553,
//"trackName":"Praia dos Rumores",
//"primaryGenreName":"Axé",
//"artworkUrl":"https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fbloco-totioque-oxe-perda-nam.png?alt=media&token=83523399-83d2-4fb1-8a20-1d75dbb82568",
//"artistId":358714030,
//"collectionName":"Oxe, perda nam!",
//"artistName":"Bloco TótiOQue",
//"wrapperType":"track"
