//
//  Product.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import Foundation

struct Product: Codable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let category: String
  let image: String
  let rating: Rating
}

struct Rating: Codable {
  let rate: Double
  let count: Double
}
