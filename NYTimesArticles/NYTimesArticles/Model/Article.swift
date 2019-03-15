//
//  Article.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

struct ArticleData: Codable {
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}

struct Article: Codable {
    let title: String
    let publishedDate: String
    let byLine: String?
    let abstract: String
    let media: [ArticleImage]?

    enum CodingKeys: String, CodingKey {
        case publishedDate = "published_date"
        case title
        case byLine = "byline"
        case abstract
        case media
    }
}

struct ArticleImage: Codable {
    let caption: String?
    let mediaMetadata: [MediaMetaData]

    enum CodingKeys: String, CodingKey {
        case caption
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetaData: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
