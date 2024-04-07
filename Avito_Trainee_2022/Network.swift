//
//  Network.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 07.04.2024.
//

import Foundation

class Network {
    
    
    static let shared = Network()
    
    func fetchData() async throws -> Model {
        
        let url = URL(string: "https://run.mocky.io/v3/d71c6b77-4b2b-4eed-8404-8a064f0df516")
        let request = URLRequest(url: url!)
        
        let (data,_) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Model.self, from: data)
        
        return response
    }
}
