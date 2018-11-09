//
//  PeopleInSpaceScreen.swift
//  TheSpaceExplorer
//
//  Created by Gabe Coelho on 10/17/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class PeopleInSpaceScreen: UIViewController {

	@IBOutlet weak var astrosLabel: UILabel!
	
	@IBOutlet weak var astrosInSpace: UILabel!
	
	var myAstros: [Astronauts] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//self.astrosInSpace.text = "There are currently " +
			
		myAstros = findAstros()

    }
    
	func findAstros() -> [Astronauts] {
		
		var astronautNames: [Astronauts] = []
		
		let url = URL(string: "http://api.open-notify.org/astros.json")!
		print("before")
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			print("Inside of URLSession")
			if let data = data {
				//let jsonData =  String(data: data, encoding: .utf8)
				let decoder = JSONDecoder()
				do {
					let astronauts = try decoder.decode(Astronauts.self, from: data)
					//astronautNames.append(astronauts)
					//self.astrosLabel.text = "my astronaut"
					//self.astrosInSpace.text = "There are currently " + String(astronauts.number) + "people in space!"
					astronautNames.append(astronauts)
					//print(astronauts)
					
					//self.astrosLabel.text = astronautNames
				} catch {
					print("Caught an error!", error)
				}
				
			}
		}
		task.resume()
		return astronautNames
	}
}
