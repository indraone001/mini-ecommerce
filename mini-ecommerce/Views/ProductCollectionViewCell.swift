//
//  ProductCollectionViewCell.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var productLike: UIImageView!
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productRatingLabel: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func configure(with product: Product) {
    self.productImageView.sd_setImage(with: URL(string: product.image))
    self.productNameLabel.text = product.title
    self.productRatingLabel.text = "\(product.rating.rate)"
    self.productPriceLabel.text = "\(product.price)"
  }

}
