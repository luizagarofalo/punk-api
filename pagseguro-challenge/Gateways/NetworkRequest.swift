import Foundation

class NetworkRequest {
    static func load(onComplete: @escaping (Beers) -> Void) {
        let url = URL(string: "https://api.punkapi.com/v2/beers")
        let session = URLSession(configuration: .default)
        session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(Beers.self, from: data)
                onComplete(response)
            } catch {
                print(error)
            }
        }.resume()
    }
}
