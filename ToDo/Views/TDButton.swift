//
//  TDButton.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import SwiftUI

struct TDButton: View {
    let backgroundColor: Color
    let textColor: Color = Color.white
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {          
            Text(title)
                .foregroundColor(textColor)
                .font(.headline)
                .bold()
                .frame(maxHeight: 40)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    TDButton(backgroundColor: Color.appMint, title: "Click Me") {}
}
