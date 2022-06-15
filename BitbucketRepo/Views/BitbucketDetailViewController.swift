import UIKit

class BitbucketDetailViewController: UIViewController {

	@IBOutlet private weak var textView: UITextView!
	var bitbucket: Bitbucket?

	override func viewDidLoad() {
		super.viewDidLoad()
		textView.translatesAutoresizingMaskIntoConstraints = true
		if let bitbucket = bitbucket {
			textView.text = """
			Author: \(bitbucket.ownerDisplayName)\n\n
			Name: \(bitbucket.name)\n\n
			Description: \(bitbucket.description)\n\n
			Type: \(bitbucket.type)\n\n
			Language: \(bitbucket.language)\n\n
			Size: \(bitbucket.size)\n\n
			Website: \(bitbucket.website)\n\n
			"""
		}
	}

}
