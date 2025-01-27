//
//  LoginView.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, backgroundColor: Color.appMint)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TDButton(backgroundColor: Color.appMint, title: "Log In") {
                        viewModel.login()
                    }
                }
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Acount", destination: RegisterView())
                        .foregroundColor(Color.appMint)
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
