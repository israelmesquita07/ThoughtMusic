//
//  ShuffleWorker.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

class ShuffleWorker {
    
    func getSongs(urlIds:[Int], onComplete:@escaping(Result) -> Void, onError:@escaping(Error) -> Void) {
        
        API().getSongs(urlIds: urlIds, onComplete: { (result) in
            onComplete(result)
        }) { (error) in
            onError(error)
        }
    }
}
