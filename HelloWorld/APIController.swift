//
//  APIController.swift
//  HelloWorld
//
//  Created by Becky Santoro on 6/6/19.
//  Copyright © 2019 Becky Santoro. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: [MyItem])
}

class APIController {
    
    var delegate: APIControllerProtocol?

    func getMajorIndexes() {
        
        let urlString = "https://financialmodelingprep.com/api/v3/majors-indexes"
        let url = URL(string: urlString)!
        
        // This is the background task available from swift for making a network request.
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            // This is the equivalent of a try catch
            do {
                let res = try JSONDecoder().decode(MyResponse?.self, from: data)
                self.delegate?.didReceiveAPIResults(results: res!.items)
            }
            catch let error {
                print(error)
            }
            // Close the dataTask block, and call resume() in order to make it run immediately
            }.resume()
    }
}
