//
//  ArticleListViewModelTests.swift
//  NYTimesArticlesTests
//
//  Created by Gaurav Gupta on 14/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import XCTest
@testable import NYTimesArticles

class ArticleListViewModelTests: XCTestCase {

    var viewModel : ArticleListViewModel!
    fileprivate var service : MockServiceHelper!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let data = loadStub(name: "sample", extension: "json")
        service = MockServiceHelper(data: data)
        viewModel = ArticleListViewModel(fetcher: service)
        viewModel.fetch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        service = nil
        super.tearDown()
    }

    func testNumberOfRows(){
        XCTAssertEqual(viewModel.numberOfRows, 20)
    }
    
    func testArticleTableVM() {
        let vm = viewModel.articleTableVM(for: 0)
        XCTAssertEqual(vm.title, "H.I.V. Is Reported Cured in a Second Patient, a Milestone in the Global AIDS Epidemic")

    }
    
    func testArticleDetailVM() {
        let vm = viewModel.articleDetailVM(for: 0)
        XCTAssertEqual(vm.title, "H.I.V. Is Reported Cured in a Second Patient, a Milestone in the Global AIDS Epidemic")
    }
}

class MockServiceHelper: ArticleResponseHandler, ArticleFetcherProtocol {
    let articleData: Data
    init(data: Data) {
        articleData = data
        super.init()
    }
    
    func fetchArticles(_ completion: @escaping ((Result<ArticleData>) -> Void)) {
        completion(mostPopularResult(data: articleData))
    }
}


