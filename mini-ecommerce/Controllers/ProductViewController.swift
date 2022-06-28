//
//  ViewController.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import UIKit

class ProductViewController: UIViewController {
  
  private var products: [Product] = [Product]()
  
  @IBOutlet weak var productCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Home"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationItem.largeTitleDisplayMode = .always
    
    self.productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
    productCollectionView.delegate = self
    productCollectionView.dataSource = self
    productCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    fetchProduct()
  }
  
  private func fetchProduct() {
    APICaller.shared.getProduct { [weak self] result in
      switch result {
      case .success(let products):
        self?.products = products
        DispatchQueue.main.async {
          self?.productCollectionView.reloadData()
        }
      case.failure (let error):
        print(error.localizedDescription)
      }
    }
  }
  
}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
    cell.configure(with: products[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let model = products[indexPath.row]
    let detailProductViewController = DetailProductViewController()
    detailProductViewController.HeroImageView.sd_setImage(with: URL(string: model.image))
    detailProductViewController.titleLabel.text = model.title
    detailProductViewController.rateLabel.text = "\(model.rating.rate)"
    detailProductViewController.priceLabel.text = "\(model.price)"
    detailProductViewController.descriptionLabel.text = model.description
    navigationController?.pushViewController(detailProductViewController, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 300)
  }
  
}

