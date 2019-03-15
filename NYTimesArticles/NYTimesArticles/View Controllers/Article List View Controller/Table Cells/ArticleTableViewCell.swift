//
//  ArticleTableViewCell.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondaryLable: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
        thumbnailImageView.layer.borderWidth = 1
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(with viewModel: ArticleTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        secondaryLable.text = viewModel.secondary
        thumbnailImageView.sd_setImage(with: viewModel.imageUrl, completed: nil)
    }
}
