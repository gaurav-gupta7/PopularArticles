//
//  ArticleDetailViewModel.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 14/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

struct ArticleDetailViewModel {
    let title: String
    let detail: String
    let by: String

    let imageUrl: URL?
    let imageCaption: String?

    init(article: Article) {
        title = article.title
        detail = article.abstract

        var tempUrl: URL?
        var tempCaption: String?
        if let metadata = article.media?.first?.mediaMetadata {
            let filtered = metadata.filter {$0.format == "Large"}
            if let url = filtered.first {
                tempUrl = URL(string: url.url)
                tempCaption = article.media?.first?.caption
            }
        }
        imageUrl = tempUrl
        imageCaption = tempCaption

        var tempBy = ""
        if let date = article.publishedDate.dateFrom(format: "yyyy-MM-dd")?.stringInFormat("MMM dd, yyyy") {
            tempBy = date
            if let temp = article.byLine {
                tempBy = temp + " | " + tempBy
            }
        }
        by = tempBy
    }
}
