//
//  NetworkService.swift
//  Pokemon
//
//  Created by Kerim Njuhovic on 23. 7. 2023..
//

import Foundation
import Combine

class NetworkService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getRequest<T: Decodable>(_ request: URLRequest, responseType: T.Type) async -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
