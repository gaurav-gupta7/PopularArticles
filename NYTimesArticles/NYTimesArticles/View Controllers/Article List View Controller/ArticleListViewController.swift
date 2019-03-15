//
//  ArticleListViewController.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    var viewModel: ArticleListViewModel!

    @IBOutlet weak var articleTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupIntials()
    }

    func setupIntials() {
        //Setup ViewModel
        viewModel = ArticleListViewModel(fetcher: ArticleServiceHelper())
        viewModel.delegate = self

        //Setup UI
        articleTableView.rowHeight = 100

        //Fetch Articles
        fetchArticles()
    }

    func fetchArticles () {
        viewModel.fetch()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "articleDetail", let vc = segue.destination as? ArticleDetailViewController {
            vc.viewModel = viewModel.articleDetailVM(for: selectedIndex)
        }
    }
}

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        cell.setup(with: viewModel.articleTableVM(for: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "articleDetail", sender: nil)
    }
}

extension ArticleListViewController: ArticleListViewModelDelegate {
    func articleListViewModel(_ viewModel: ArticleListViewModel, fetchedArticles: Bool) {
        activityIndicator.stopAnimating()
        if fetchedArticles {
            articleTableView.reloadData()
        }
    }

    func articleListViewModelFailedWtith(title: String, message: String) {
        activityIndicator.stopAnimating()

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func articleListViewModelWillStartFetchingArticles() {
        activityIndicator.startAnimating()
    }
}
