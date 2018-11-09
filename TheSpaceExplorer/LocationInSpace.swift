//
//  LocationInSpace.swift
//  TheSpaceExplorer
//
//  Created by Gabe Coelho on 10/17/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

struct Location: Decodable {
	let location: Position
	
	private enum CodingKeys: String, CodingKey {
		case location = "iss_position"
	}
}

struct Position: Decodable {
	let longitude: String
	let latitude: String
}
