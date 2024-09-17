//
//  NetworkManager.swift
//  MovieApp-MVVM
//
//  Created by Alican TARIM on 17.09.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}  // Private yapmazsak istedigimiz kadar NetworkManager olusturabiliriz.
    
    // Escaping Clousure kullanmamizin sebebi Atilan istek hemen gelmeyecegi icin
    // Clousure tutulur istek geldigi zaman calisir.
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return // return le clouser dan direkt cikiyoruz.
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                
                completion(.failure(URLError(.badURL)))
                return
            }
            
            completion(.success(data))
        }
    }
}
