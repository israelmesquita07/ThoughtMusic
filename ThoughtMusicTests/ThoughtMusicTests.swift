//
//  ThoughtMusicTests.swift
//  ThoughtMusicTests
//
//  Created by Israel on 23/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import XCTest
@testable import ThoughtMusic

class ThoughtMusicTests: XCTestCase {

    var sut: ShuffleViewController!
    var songsArray:[Song]!
    var song:Song!
    
    override func setUp() {
        super.setUp()
        sut = ShuffleViewController()
        songsArray = getAPISongData()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        song = songsArray[0]
        guard song != nil else { return }
        XCTAssertEqual(song.artistName, "Bloco TótiOQue")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private func getAPISongData() -> [Song]? {
        
        if let path = Bundle.main.path(forResource: "Songs", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let result = try? decoder.decode(Result.self, from: data) {
                    return result.results
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
        return nil
    }

}
