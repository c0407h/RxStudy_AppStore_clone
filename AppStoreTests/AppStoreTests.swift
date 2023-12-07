//
//  AppStoreTests.swift
//  AppStoreTests
//
//  Created by Chung Wussup on 2023/09/16.
//

// Given When Then

import XCTest
import Alamofire
@testable import AppStore

final class AppStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_RCGenerator() {
        let sut = Generator()
        let app = TestAppModel()
        
        let reviewCount = sut.reviewCount(with: app.userRatingCount)
//        app.userRatingCount // 11782

//        let expected = "1만"
//        XCTAssertEqual(reviewCount, expected)

        let expected2 = "1.2만"
        XCTAssertEqual(reviewCount, expected2)
    }
    
    func test_ByteGenerator() {
        let sut = Generator()
        let app = TestAppModel()
        
        let fileSize = sut.byteSize(with: app.fileSizeBytes)
        
//        let expected = ""
//        let expected = "329.9"
        let expected = "329.9MB"
        XCTAssertEqual(fileSize, expected)
    }
    
    func test_LanguageCount() {
        let sut = Generator()
        let app = TestAppModel()
        
        let languageCnt = sut.languageCnt(with: app.languageCodesISO2A)

//        let expected = "한국어 외 1개"
//        let expected = "한국어 외"
        let expected = "한국어"

        XCTAssertEqual(languageCnt, expected)
    }
    

    func test_SearchTextMatching() {
        let sut = Generator()
        let searchText = "카"
        let mySearchTexts = ["카카오", "카카오뱅크", "카카오T", "네이버", "다음", "당근마켓", "피피", "피피프렌즈", "서울", "영등포"]
        
        let matchingTexts = sut.matchingMySearchText(searchText: searchText, mySearchingTexts: mySearchTexts)
        
//        let expected: [String] = []
        let expected: [String] = ["카카오", "카카오뱅크", "카카오T"]
        
        XCTAssertEqual(matchingTexts, expected)
    }
    
    func test_ApiCall() {
        let sut = Generator()
        let seachText = "카카오뱅크"

//        var expected: Bool = false
        var expected: Bool = true
        let fetchApps = sut.fetchApps(searchText: seachText) { _, _ in }
        
        XCTAssertEqual(fetchApps, expected)
        
    }
}
