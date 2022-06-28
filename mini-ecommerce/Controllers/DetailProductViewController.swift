//
//  DetailProductViewController.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import UIKit

class DetailProductViewController: UIViewController {
  
  @IBOutlet weak var HeroImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func checkoutButtonPressed(_ sender: UIButton) {
  }
  
}
