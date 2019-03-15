//
//  ArticleTests.swift
//  NYTimesArticlesTests
//
//  Created by Gaurav Gupta on 14/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticleTests: XCTestCase {

    var article: Article!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let data = loadStub(name: "sample", extension: "json")
        let decoder = JSONDecoder()
        
        if let articlesData = try? decoder.decode(ArticleData.self, from: data) {
            article = articlesData.articles.first
        }
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        article = nil
        super.tearDown()
    }

    func testArticleProperties() {
        XCTAssertEqual(article.title, "H.I.V. Is Reported Cured in a Second Patient, a Milestone in the Global AIDS Epidemic")
        XCTAssertEqual(article.publishedDate, "2019-03-04")
        XCTAssertEqual(article.byLine, "By APOORVA MANDAVILLI")
        XCTAssertEqual(article.abstract, "Scientists have long tried to duplicate the procedure that led to the first long-term remission 12 years ago. With the so-called London patient, they seem to have succeeded.")
        XCTAssertEqual(article.media?.count, 1)
    }
    
    func testArticleImageProperties() {
        guard let articleImage = article.media?.first else {
            XCTAssert(false, "ArticleImage should not be nil")
            return
        }
        XCTAssertEqual(articleImage.caption, "A colored transmission electron micrograph of the H.I.V. virus, in green, attaching to a white blood cell, in orange.")
        XCTAssertEqual(articleImage.mediaMetadata.count, 10)
    }
    
    func testMediaMetaDataProperties() {
        guard let metaData = article.media?.first?.mediaMetadata.first else {
            XCTAssert(false, "MediaMetaData should not be nil")
            return
        }
        XCTAssertEqual(metaData.url, "https://static01.nyt.com/images/2019/03/06/science/05HIV1/05HIV1-square320.jpg")
        XCTAssertEqual(metaData.format, "square320")
        XCTAssertEqual(metaData.height, 320)
        XCTAssertEqual(metaData.width, 320)
    }

}
