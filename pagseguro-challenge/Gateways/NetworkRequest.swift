import Foundation

class NetworkRequest {
    static func load<T: Codable>(onComplete: @escaping (Result<T>) -> Void) {
        let url = URL(string: "https://api.punkapi.com/v2/beers")
        let session = URLSession(configuration: .default)
        session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                onComplete(.failure(error))
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                onComplete(.success(response))
            } catch {
                onComplete(.failure(error))
            }
        }.resume()
    }
}
