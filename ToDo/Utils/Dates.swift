//
//  Dates.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import Foundation

class Dates {
    static func prettyDateString(at timeInterval: TimeInterval) -> String {
        return Date(timeIntervalSince1970: timeInterval)
            .formatted(date: .abbreviated, time: .shortened)
    }
}
