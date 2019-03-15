//
//  ArticleListViewModel.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

class ArticleListViewModel {
    private let fetcher: ArticleFetcherProtocol
    private var articles: [Article]? {
        didSet {
            guard let temp = articles else {
                articlesVM = nil
                return
            }
            articlesVM = temp.map({ (article) -> ArticleTableViewCellViewModel in
                return ArticleTableViewCellViewModel(article: article)
            })
        }
    }
    private var articlesVM: [ArticleTableViewCellViewModel]?
    weak var delegate: ArticleListViewModelDelegate?
    var numberOfRows: Int {return articles?.count ?? 0}

    init(fetcher: ArticleFetcherProtocol) {
        self.fetcher = fetcher
    }

    func fetch() {
        delegate?.articleListViewModelWillStartFetchingArticles()
        fetcher.fetchArticles { [weak self] (response) in
            guard let strongSelf = self else {return}
            switch response {
            case .success(let articleData):
                strongSelf.articles = articleData.articles
                DispatchQueue.main.async {
                    strongSelf.delegate?.articleListViewModel(strongSelf, fetchedArticles: true)
                }
            case .error(let error):
                DispatchQueue.main.async {
                    strongSelf.delegate?.articleListViewModel(strongSelf, fetchedArticles: false)
                    strongSelf.delegate?.articleListViewModelFailedWtith(title: "", message: error.localizedDescription)
                }
            }
        }
    }

    func articleTableVM(for index: Int) -> ArticleTableViewCellViewModel {
        return articlesVM![index]
    }
    func articleDetailVM(for index: Int) -> ArticleDetailViewModel {
        return ArticleDetailViewModel(article: articles![index])
    }
}

protocol ArticleListViewModelDelegate: class {
    func articleListViewModel(_ viewModel: ArticleListViewModel, fetchedArticles: Bool)
    func articleListViewModelFailedWtith(title: String, message: String)
    func articleListViewModelWillStartFetchingArticles()
}

protocol ArticleFetcherProtocol {
    func fetchArticles(_ completion: @escaping ((Result<ArticleData>) -> Void))
}

enum Result<T> {
    case success(T)
    case error(Error)
}

enum ErrorResult: Error {
    case network(String)
    case parse(String)
    case custom(String)
}
