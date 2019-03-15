//
//  ArticleServiceHelper.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

class ArticleServiceHelper: ArticleResponseHandler, ArticleFetcherProtocol {
    func fetchArticles(_ completion: @escaping ((Result<ArticleData>) -> Void)) {
        let session = URLSession.shared
        let urlPath = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=6YzRLjv4OZAgyzYhRcizleQDzmnwW15U"
        guard let url = URL(string: urlPath) else {
            fatalError("URL not valid")
        }
        session.dataTask(with: url) {[weak self] (data, _, error) in
            guard let strongSelf = self else {return}
            if let error = error {
                completion(.error(ErrorResult.network(error.localizedDescription)))
                return
            }
            if let data = data {
                completion(strongSelf.mostPopularResult(data: data))
            }
        }.resume()
    }
}
