//
//  ToDoApp.swift
//  ToDo
//
//  Created by Taylor on 1/24/25.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    @StateObject var currentUserViewModel = CurrentUserViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    @ViewBuilder
    var appView: some View {
        TabView {
            ToDoListView(userId: currentUserViewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .accentColor(Color.appMint)
    }
    
    var body: some Scene {
        WindowGroup {
            if currentUserViewModel.isLoading {
                LoadingScreenView()
            } else if currentUserViewModel.isSignedIn, !currentUserViewModel.currentUserId.isEmpty {
                appView
            } else {
                LoginView()
            }
        }
    }
}
