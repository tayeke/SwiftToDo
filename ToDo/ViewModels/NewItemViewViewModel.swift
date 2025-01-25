//
//  NewItemViewViewModel.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var alertText = ""
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newItem = ToDoListItem(
            id: UUID().uuidString,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDisctionary())
    }
    
    public var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            alertText = "Please Fill in all fields"
            
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            // due date should be >= yesterday to simplify time zone support
            alertText = "Please select a date in the future"
            
            return false
        }
        
        return true
    }
}
