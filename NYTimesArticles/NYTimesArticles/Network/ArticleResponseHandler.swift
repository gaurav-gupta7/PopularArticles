//
//  ArticleResponseHandler.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

class ArticleResponseHandler {

    func mostPopularResult(data: Data) -> Result<ArticleData> {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(ArticleData.self, from: data)
            return .success(response)
        } catch {
            return .error(ErrorResult.parse("We could not decode the response."))
        }

    }
}
