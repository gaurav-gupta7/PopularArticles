//
//  ArticleTableViewCellViewModel.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

struct ArticleTableViewCellViewModel {

    init(article: Article) {
        title = article.title
        if let metadata = article.media?.first?.mediaMetadata {
            let filtered = metadata.filter {$0.format == "Standard Thumbnail"}
            if let url = filtered.first?.url {
                imageUrl = URL(string: url)
            } else {
                imageUrl = nil
                }
        } else {
            imageUrl = nil
        }
        if let date = article.publishedDate.dateFrom(format: "yyyy-MM-dd")?.stringInFormat("dd MMM") {
            secondary = date
        } else {
            secondary = ""
        }
    }

    let  title: String
    let imageUrl: URL?
    let secondary: String
}
