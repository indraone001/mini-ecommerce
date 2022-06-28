//
//  APICaller.swift
//  mini-ecommerce
//
//  Created by deri indrawan on 28/06/22.
//

import Foundation
import Alamofire

struct constans {
  static let baseURL = "https://fakestoreapi.com/products"
}

class APICaller {
  static let shared = APICaller()
  
  func getProduct(completion: @escaping (Result<[Product], Error>) -> Void) {
    let url = "\(constans.baseURL)"
    AF.request(url, method: .get, encoding: URLEncoding.default)
      .validate(statusCode: 200..<300)
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode([Product].self, from: data)
            completion(.success(result))
          } catch {
            completion(.failure(error))
          }
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
  
  func getDetailProduct(with id: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
    let url = "\(constans.baseURL)/\(id)"
    AF.request(url, method: .get, encoding: URLEncoding.default)
      .validate(statusCode: 200..<300)
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode([Product].self, from: data)
            completion(.success(result))
          } catch {
            completion(.failure(error))
          }
        case .failure(let error):
          print("✅")
          completion(.failure(error))
        }
      }
  }
}
