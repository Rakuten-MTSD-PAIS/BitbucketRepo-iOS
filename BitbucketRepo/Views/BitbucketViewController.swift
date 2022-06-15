import UIKit

class BitbucketViewController: UIViewController {

	@IBOutlet private weak var tableView: UITableView!
	private let viewModel = BitbucketViewModel()
	lazy var reload: ([Bitbucket]) -> Void = { dataSource in
		DispatchQueue.main.async {
			self.dataSource = dataSource
			self.tableView.reloadData()
		}
	}
	private var dataSource: [Bitbucket] = []
	private let showDetailIdentifier = "showDetail"

	deinit {
		print("DEINIT \(BitbucketViewController.self)")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		viewModel.view = self
		DispatchQueue.main.async { [self] in
			sleep(2)
			viewModel.fetch()
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == showDetailIdentifier {
			guard let indexPath = tableView.indexPathsForVisibleRows?.first, let controller = segue.destination as? BitbucketDetailViewController else { return }
			controller.bitbucket = dataSource[indexPath.row]
		}
	}

}

////////////////////////////////////////////////////////////////
//MARK: - TableView Delegate & DataSource
////////////////////////////////////////////////////////////////

extension BitbucketViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: showDetailIdentifier, sender: self)
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BitbucketTableViewCell.self), for: indexPath) as? BitbucketTableViewCell else { return UITableViewCell() }
		cell.configure(bitbucket: dataSource[indexPath.row])
		return cell
	}
}

