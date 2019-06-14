//
//  MajorStockIndexes.swift
//  HelloWorld
//
//  Created by Becky Santoro on 6/6/19.
//  Copyright © 2019 Becky Santoro. All rights reserved.
//

import Foundation

class MyResponse: Codable {
    let items: [MyItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "majorIndexesList"
    }
}

class MyItem: Codable {
    
    let ticker: String
    let indexName: String
    let price: Float
    let changes: Float
    
    enum CodingKeys: String, CodingKey {
        case ticker = "ticker"
        case indexName = "indexName"
        case price = "price"
        case changes = "changes"
    }
}
