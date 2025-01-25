//
//  LoginViewViewModel.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        guard Validators.isValidEmail(email) else {
            
            errorMessage = "Please enter valid email"
            
            return false
        }
        
        guard Validators.isValidPassword(password) else {
            
            errorMessage = "Please enter a password of 6 or more characters"
            
            return false
        }
        
        return true
    }
}
