//
//  UserProfileView.swift
//  Warp-Assessment
//
//  Created by Juliaan Evenwel on 2025/08/06.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: user.avatarUrl)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else if phase.error != nil {
                    Color.gray.frame(width: 100, height: 100)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            
            Text(user.name ?? "No Name")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("@\(user.login)")
                .foregroundColor(.secondary)
            
            if let bio = user.bio {
                Text(bio)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            HStack {
                VStack {
                    Text("Repos")
                    Text("\(user.publicRepos)")
                }
                .padding()
                
                VStack {
                    Text("Followers")
                    Text("\(user.followers)")
                }
                .padding()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 4)
    }
    
}

#Preview {
    //UserProfileView()
}
