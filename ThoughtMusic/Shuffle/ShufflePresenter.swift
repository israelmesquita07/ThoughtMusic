//
//  ShufflePresenter.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol ShufflePresenterProtocol {
    func showSongs(songs: [Song])
    func showError(_ bool:Bool)
    func toggleLoading(_ bool:Bool)
}

class ShufflePresenter: ShufflePresenterProtocol {
    
    var shufflePresenterDelegate: ShuffleViewControllerProtocol?
    
    func showSongs(songs: [Song]) {
        let songs = songs.filter{ $0.wrapperType == "track"}
        shufflePresenterDelegate?.showSongs(songs: songs)
    }
    
    func showError(_ bool: Bool) {
        shufflePresenterDelegate?.showError(bool)
    }
    
    func toggleLoading(_ bool: Bool) {
        shufflePresenterDelegate?.toggleLoading(bool)
    }
}
