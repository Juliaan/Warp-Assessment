//
//  ContentView.swift
//  Warp-Assessment
//
//  Created by Juliaan Evenwel on 2025/08/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    @State private var username: String = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                Text("Github User Search")
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(0)
            }
            
            HStack {
                    
                TextField("Enter GitHub user name", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Search") {
                    UIApplication.shared.endEditing()
                    viewModel.fetchUser(username: username)
                    username = "" // Reset the TextField after search
                }
                //.padding()
                .disabled(viewModel.isLoading)
                
            }
            .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            if let user = viewModel.user {
                UserProfileView(user: user)
                    .padding()
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
        Spacer()
    }
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
