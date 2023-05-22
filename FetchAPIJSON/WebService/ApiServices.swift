//
//  ApiServices.swift
//  FetchAPIJSON
//
//  Created by Claudio Tendean on 22/05/23.
//

import Foundation
import SwiftUI

class ApiServices : ObservableObject {
    @Published var post = [Post]()
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let PostData = data {
                    let decodedData = try JSONDecoder().decode([Post].self, from: PostData)
                    DispatchQueue.main.async {
                        self.post = decodedData
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
