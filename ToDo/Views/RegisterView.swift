//
//  RegisterView.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organizing", angle: -15, backgroundColor: Color.appOrange)
        }
        
        if !viewModel.errorMessage.isEmpty {
            Text(viewModel.errorMessage).foregroundColor(Color.red)
        }
        
        
        Form {
            TextField("Full Name", text: $viewModel.fullName)
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $viewModel.email)
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
            
            TDButton(backgroundColor: Color.appOrange, title: "Create Account") {
                viewModel.register()
            }
        }
    }
}

#Preview {
    RegisterView()
}
