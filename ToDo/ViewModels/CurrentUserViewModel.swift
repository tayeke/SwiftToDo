//
//  CurrentUserViewModel.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseAuth
import Foundation

class CurrentUserViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var isLoading: Bool = true
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.isLoading = false // Mark loading as complete when app first opens
                }
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
