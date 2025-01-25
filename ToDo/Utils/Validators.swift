//
//  Validators.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import Foundation

class Validators {
    static func isValidEmail(_ email: String) -> Bool {
        guard let emailRegex = try? Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") else { return false }
        return email.firstMatch(of: emailRegex) != nil
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
