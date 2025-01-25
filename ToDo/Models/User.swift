//
//  User.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import Foundation

struct User: Codable {
    let id: String
    let fullName: String
    let email: String
    let joined: TimeInterval
}
