import Foundation
import UIKit

class BitbucketViewModel {

	let repository: BitbucketRepositoryType
	var view: BitbucketViewController!
	var hasNextPage: Bool {
		guard let nextPageURL = repository.nextPageURL, !nextPageURL.isEmpty else { return false }
		return true
	}

	init(repository: BitbucketRepositoryType = BitbucketRepository()) {
		self.repository = repository
	}

	deinit {
		print("DEINIT \(BitbucketViewModel.self)")
	}

	func fetch() {
		repository.fetch("https://api.bitbucket.org/2.0/repositories") { [self] result in
			resultHandler(result, completion: view.reload)
		}
	}

	private func resultHandler(_ result: Result<[Bitbucket], Error>, completion: @escaping ([Bitbucket]) -> Void) {
		switch result {
			case .success(let datasource):
				completion(datasource)
			case .failure(let error):
				print(error.localizedDescription)
				completion([])
		}
	}

}
