//
//  RemoteItemService.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 11/03/23.
//

import Foundation

class APIService<T: Codable> {
    let accessToken = "token"
    
    func request(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.setValue("\(accessToken)", forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Código de status: ", response.statusCode)
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Sem dados"])
                completion(.failure(error))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
