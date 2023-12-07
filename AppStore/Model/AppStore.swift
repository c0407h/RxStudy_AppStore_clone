//
//  AppStore.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import Foundation

struct AppStore: Codable {
    var resultCount: Int
    var results: [App]
    
    
}


struct App: Codable {
    var supportedDevices: [String]? //지원 디바이스
    var features: [String]? //
    var isGameCenterEnabled: Bool? // 게임센터 필요여부
    var advisories: [String]? // 경고 문구
    var screenshotUrls: [String] // 스크린샷
    var ipadScreenshotUrls: [String]? // 아이패드 스크린샷
    var appletvScreenshotUrls: [String]? // 애플티비 스크린샷
    var artworkUrl60: String? // 앱아이콘
    var artworkUrl512: String // 앱아이콘
    var artworkUrl100: String? // 앱아이콘
    var artistViewUrl: String? //
    var kind: String? // 종류
    var releaseNotes: String // 업데이트 문구
    var description: String // 소개 문구
    var artistId: Int? // 업로드 계정 id
    var artistName: String? // 업로드 계정 name
    var genres: [String?] // 장르
    var price: Double? // 가격
    var primaryGenreName: String? // 주요장르
    var primaryGenreId: Int? // 주요 장르 아이디
    var releaseDate: String? // 최초 업로드 날자
    var bundleId: String? // 번들id
    var isVppDeviceBasedLicensingEnabled: Bool? // ??
    var currentVersionReleaseDate: String //최근업로드 날자
    var genreIds: [String]? // 장르 id
    var sellerName: String // 업로더(판매자) 이름
    var trackCensoredName: String? // 앱이름
    var languageCodesISO2A: [String?] // 언어
    var fileSizeBytes: String // 파일 사이즈
    var sellerUrl: String? // 업로더(판매자) 홈페이지
    var formattedPrice: String? // 가격
    var contentAdvisoryRating: String? // 구매 연령
    var averageUserRatingForCurrentVersion: Double? // 유저 평점
    var userRatingCountForCurrentVersion: Int? // 최근 버전 평가 수
    var averageUserRating: Double // 유저 평점
    var trackViewUrl: String? //
    var trackContentRating: String // 구매 연령
    var currency: String? // 원화 (krw)
    var minimumOsVersion: String? // 모바일 최소버전
    var version: String // 앱버전
    var wrapperType: String? // 호출 타입 softWare
    var trackId: Int? // 앱 id
    var trackName: String // 앱 name
    var userRatingCount: Int // 평가 수
    
    var fileSize: String {
        get {
            if let bytes = Float(fileSizeBytes) {
                return "\(round(bytes / 1024.0 / 1024.0 * 10) / 10)MB"
            } else {
                return "\(fileSizeBytes)Byte"
            }
        }
    }
    
    var languageTitle: String {
        if languageCodesISO2A.count == 1 {
            return "한국어"
        }
        return "한국어 외 \(languageCodesISO2A.count - 1)개"
    }
    
    enum CodingKeys: String, CodingKey{
        case supportedDevices, features, isGameCenterEnabled, advisories, screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100, artistViewUrl, kind, releaseNotes, description, artistId, artistName, genres, price, primaryGenreName, primaryGenreId, releaseDate, bundleId, isVppDeviceBasedLicensingEnabled, currentVersionReleaseDate, genreIds, sellerName, trackCensoredName, languageCodesISO2A, fileSizeBytes, sellerUrl, formattedPrice, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating, trackViewUrl, trackContentRating, currency, minimumOsVersion, version, wrapperType, trackId, trackName, userRatingCount
        
    }
}
