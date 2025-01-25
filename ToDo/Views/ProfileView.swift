//
//  ProfileView.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseFirestore
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.appMint)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Full Name: ").bold()
                            Text(user.fullName)
                        }.padding(.vertical)
                        HStack {
                            Text("Email: ").bold()
                            Text(user.email)
                        }.padding(.vertical)
                        HStack {
                            Text("Member Since: ").bold()
                            Text(Dates.prettyDateString(at: user.joined))
                        }.padding(.vertical)
                    }
                    
                    TDButton(backgroundColor: Color.appOrange, title: "Log Out") {
                        viewModel.logOut()
                    }
                    .padding(10)
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
}

#Preview {
    ProfileView()
}
