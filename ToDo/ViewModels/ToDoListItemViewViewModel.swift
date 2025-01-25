//
//  ToDoListItemViewViewModel.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var mutableItem = item
        mutableItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(mutableItem.id)
            .setData(mutableItem.asDisctionary())
    }
}
