//
//  Fact.swift
//  API_HW
//
//  Created by Daniil Belyaev on 06.08.2021.
//

import Foundation

struct FactElement: Codable {
    let fact: String
    
    static func getFacts(from value: Any) -> Fact {
        guard let factsData = value as? [[String: Any]] else { return []}
        var facts: [FactElement] = []
        for factData in factsData {
            let fact = FactElement(fact: factData["fact"] as! String)
            facts.append(fact)
        }
        return facts as? Fact ?? []
    }
    
}

typealias Fact = [FactElement]
