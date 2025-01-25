//
//  ToDoListItemView.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                
                Text(Dates.prettyDateString(at: item.dueDate))
                    .font(.footnote)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
    
}

#Preview {
    ToDoListItemView(item: .init(
            id: "123",
            title: "GetMilk",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
    )
}
