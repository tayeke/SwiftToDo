//
//  LoadingScreenView.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import SwiftUI

struct LoadingScreenView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            Text("To ✅ Do ✅")
                .font(.system(size: 50))
                .bold()
                .offset(y: -100)
        }
        .statusBarHidden(true)
    }
}

#Preview {
    LoadingScreenView()
}
