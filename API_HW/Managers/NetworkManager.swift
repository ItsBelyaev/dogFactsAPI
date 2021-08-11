//
//  NetworkManager.swift
//  API_HW
//
//  Created by Daniil Belyaev on 06.08.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
        
//    func fetchData(completionHandler: @escaping (Fact) -> Void) {
//        let urlString = "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all"
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                guard let facts = self.parseJSON(data: data) else {return}
//                completionHandler(facts)
//            }
//        }.resume()
//    }
//    func parseJSON(data: Data) -> Fact? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(Fact.self, from: data)
//            return decodedData
//        } catch {
//            print(error)
//            return nil
//        }
//    }

    func fetchData(completionHandler: @escaping (Fact) -> Void) {
        AF.request("https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all", method: .get)
            .validate().responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = FactElement.getFacts(from: value)
                    completionHandler(courses)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    private init() {}
}
