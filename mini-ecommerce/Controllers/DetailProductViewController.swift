//
//  DetailProductViewController.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import UIKit

class DetailProductViewController: UIViewController {
  
  private var productId: Int
  
  @IBOutlet weak var HeroImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  init(with id: Int) {
    self.productId = id
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchDetailProduct()
  }
  
  private func fetchDetailProduct() {
    APICaller.shared.getDetailProduct(with: productId, completion: { [weak self] result in
      switch result {
      case .success(let products):
        let detailProducts: Product
        detailProducts = products
        DispatchQueue.main.async {
          self?.HeroImageView.sd_setImage(with: URL(string: detailProducts.image))
          self?.titleLabel.text = detailProducts.title
          self?.rateLabel.text = "\(detailProducts.rating.rate)"
          self?.priceLabel.text = "\(detailProducts.price)"
          self?.descriptionLabel.text = detailProducts.description
        }
      case.failure (let error):
        print(error.localizedDescription)
      }
    })
  }
  
  @IBAction func checkoutButtonPressed(_ sender: UIButton) {
    
  }
  
}
