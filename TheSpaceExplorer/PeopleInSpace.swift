//
//  PeopleInSpace.swift
//  TheSpaceExplorer
//
//  Created by Gabe Coelho on 10/17/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

struct Astronauts: Decodable {
	let people: [People]
	let number: Int
}
struct People: Decodable {
	let name: String
	let craft: String
}
