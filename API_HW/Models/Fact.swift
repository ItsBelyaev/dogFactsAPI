//
//  Fact.swift
//  API_HW
//
//  Created by Daniil Belyaev on 06.08.2021.
//

import Foundation

struct FactElement: Codable {
    let fact: String
}

typealias Fact = [FactElement]
