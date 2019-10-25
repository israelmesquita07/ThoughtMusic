//
//  ShuffleInteractor.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol ShuffleInteractorProtocol {
    func getSongs(urlIds: [Int])
}

class ShuffleInteractor: ShuffleInteractorProtocol {
    
    var shuffleInteractorDelegate: ShufflePresenterProtocol?
    private var worker: ShuffleWorker?
    
    func getSongs(urlIds: [Int]) {
     
        worker = ShuffleWorker()
        worker?.getSongs(urlIds: urlIds, onComplete: { [weak self] (result) in
            
            guard let self = self else { return }
            guard let songs = result.results else {
                self.shuffleInteractorDelegate?.showError(true)
                return
            }
            self.shuffleInteractorDelegate?.showSongs(songs: songs)
            
        }, onError: { (error) in
            self.shuffleInteractorDelegate?.showError(true)
        })
        worker = nil
    }
}
