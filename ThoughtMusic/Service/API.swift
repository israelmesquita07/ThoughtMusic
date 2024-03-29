//
//  API.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import Foundation

protocol APIService {
    func getSongs(urlIds:[Int], onComplete:@escaping(Result) -> Void, onError:@escaping(Error) -> Void)
}

class API: APIService {
    
    func getSongs(urlIds: [Int], onComplete: @escaping (Result) -> Void, onError: @escaping (Error) -> Void) {
        if let url = URL(string: Endpoint.getSongs(ids: urlIds) ?? "0") {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    guard let data = data else { return }
                    if let dictJson = self.parseDataToDictionary(data) {
                        if let model = try? JSONDecoder().decode(Result.self, from: JSONSerialization.data(withJSONObject: dictJson, options: .prettyPrinted)) {
                            onComplete(model)
                        }
                    }
                    
                } else {
                    onError(error!)
                }
            }
            dataTask.resume()
        }
    }
    
    private func parseDataToDictionary(_ data:Data) -> [String: Any]? {
        
        if let dictJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
            return dictJson
        }
        return nil
    }
    
}
