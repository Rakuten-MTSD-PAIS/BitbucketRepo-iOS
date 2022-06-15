import Foundation
import SwiftyJSON

protocol ApiClientType {
	func get(url: String, completion: @escaping (Result<JSON, Error>) -> Void)
}

class ApiClient: ApiClientType {

	let session: URLSession

	init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
		self.session = session
	}

	func get(url: String, completion: @escaping (Result<JSON, Error>) -> Void) {
		guard let url = URL(string: url) else { return }

		let completionHandler = { (data: Data?, response: URLResponse?, error: Error?) in
			// Error
			if let error = error {
				completion(.failure(error))
			}

			// Success
			if let data = data {
				completion(.success(JSON(data)))
			}
		}

		session.dataTask(with: url, completionHandler: completionHandler).resume()
	}

}
