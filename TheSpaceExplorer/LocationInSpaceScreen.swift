//
//  LocationInSpaceScreen.swift
//  TheSpaceExplorer
//
//  Created by Gabe Coelho on 10/17/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class LocationInSpaceScreen: UIViewController {

	@IBOutlet weak var locationLabel: UILabel!
	
	var newPosition: [Location] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		print("good")
		newPosition = findStation()
		//print(newPosition, "NEW POS")
		//self.locationLabel.text = newPosition.joined(separator: ",")
    }
	
	func findStation() -> [Location] {
		
		var position: [Location] = []
		
		let url = URL(string: "http://api.open-notify.org/iss-now.json")!
		print("before")
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			print("Inside of URLSession")
			if let data = data {
				//let jsonData =  String(data: data, encoding: .utf8)
				let decoder = JSONDecoder()
				do {
					let location = try decoder.decode(Location.self, from: data)
					position.append(location)
					print(location.location)

				} catch {
					print("Caught an error!", error)
				}

			}
		}
		task.resume()
		return position
	}

}
