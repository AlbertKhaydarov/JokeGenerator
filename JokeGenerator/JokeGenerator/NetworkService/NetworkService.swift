//
//  NetworkService.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import Foundation

final class NetworkService{
    
    private func getSearchResult(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        // MARK: - вариант1 через расшаривание данных
        let searchTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
                //                    let someString = String(data: data, encoding: .utf8)
                //                    print(someString ?? "no data")
            }
        }
        searchTask.resume()
    }

    func parsSearchResults(response: @escaping (JokeResponse?) -> Void) {
        let url = getUrl()
        getSearchResult(url: url) { (result) in
            switch result {
            case.success(let data):
                do {
                    let films = try JSONDecoder().decode(JokeResponse.self, from: data)
                    response(films)
                    print(films)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)" )
                response(nil)
            }
        }
    }
   private func getUrl() -> URL{
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path
        return components.url!
    }
}
