//
//  ArticleDetailViewController.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 14/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!

    var viewModel: ArticleDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupInitials()
    }

    func setupInitials() {
        //Setup navigationItem
        self.navigationItem.largeTitleDisplayMode = .never

        //Setup UI
        mediaImageView.sd_setImage(with: viewModel.imageUrl, completed: nil)
        captionLabel.text = viewModel.imageCaption
        titleLabel.text = viewModel.title
        byLabel.text = viewModel.by
        detailsLabel.text = viewModel.detail
    }

}
