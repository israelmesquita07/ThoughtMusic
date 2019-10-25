//
//  Utils.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

class Utils {
    
    //No tempo hábil não consegui um shuffle não repetido. Algoritmo não próprio.
    class func noRepeatedSort(_ a: [Song]) -> [Song] {
        // construct a measure of "blockiness"
        func blockiness(_ a: [Song]) -> Int {
            var bl = 0
            for i in 0 ..< a.count {
                // Wrap around, as OP wants this on a circle
                if a[i].artistId == a[(i + 1) % a.count].artistId { bl += 1 }
            }
            return bl
        }
        var aCopy = a // Make it a mutable var
        var giveUpAfter = aCopy.count // Frankly, arbitrary...
        while (blockiness(aCopy) > 0) && (giveUpAfter > 0) {
            // i.e. we give up if either blockiness has been removed ( == 0)
            // OR if we have made too many changes without solving

            // Look for adjacent pairs
            for i in 0 ..< aCopy.count {
                // Wrap around, as OP wants this on a circle
                let prev = (i - 1 >= 0) ? i - 1 : i - 1 + aCopy.count
                if aCopy[i].artistId == aCopy[prev].artistId { // two adjacent elements match
                    let next = (i + 1) % aCopy.count // again, circular
                    // move the known match away, swapping it with the "unknown" next element
                    (aCopy[i], aCopy[next]) = (aCopy[next], aCopy[i])
                }
            }
            giveUpAfter -= 1
        }
        return aCopy
    }
}
