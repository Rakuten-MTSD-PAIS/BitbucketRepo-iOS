import Foundation
import SwiftyJSON

struct Bitbucket {
	
	let name: String
	let description: String
	let language: String
	let type: String
	let size: Int
	let website: String
	let createdDate: String
	
	// MARK: - Owner
	let ownerDisplayName: String
	let ownerType: String
	let ownerAvatarURL: String
}

////////////////////////////////////////////////////////////////
//MARK: - JSON Parse
////////////////////////////////////////////////////////////////

extension Bitbucket {
	
	static func parse(json: JSON) -> Bitbucket {
		let description = json["description"].stringValue
		let name = json["name"].stringValue
		let language = json["language"].stringValue
		let type = json["type"].stringValue
		let size = json["size"].intValue
		let website = json["website"].stringValue
		let createdDate = json["created_on"].stringValue
		
		// Owner
		let ownerJSON = json["owner"]
		let ownerDisplayName = ownerJSON["display_name"].stringValue
		let ownerType = ownerJSON["type"].stringValue
		let ownerAvatarURL = ownerJSON["links"]["avatar"]["href"].stringValue
		return Bitbucket(
			name: name,
			description: description,
			language: language,
			type: type,
			size: size,
			website: website,
			createdDate: createdDate,
			ownerDisplayName: ownerDisplayName,
			ownerType: ownerType,
			ownerAvatarURL: ownerAvatarURL
		)
	}
	
}
