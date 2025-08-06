//
//  UserViewModel.swift
//  Warp-Assessment
//
//  Created by Juliaan Evenwel on 2025/08/06.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchUser(username: String) {
        
        // implement strict guards to ensure we can handle issues
        guard !username.isEmpty else {
            self.errorMessage = "Please enter a username."
            return
        }

        let urlString = "https://api.github.com/users/\(username)"
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL."
            return
        }

        self.isLoading = true
        self.errorMessage = nil

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                
                self.isLoading = false

                // when there is a network error
                if let error = error {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                    self.user = nil
                    return
                }

                // Check response status from API call, looking for a 200
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 404 {
                    self.errorMessage = "User not found."
                    self.user = nil
                    return
                }

                // Parse data
                if let data = data {
                    
                    do {
                        
                        let userDecoder = JSONDecoder()
                        // handle snake_case properties from github as we use camelCase in swift
                        userDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        let fetchedUser = try userDecoder.decode(User.self, from: data)
                        self.user = fetchedUser
                    } catch {
                        self.errorMessage = "Failed to parse user data."
                        self.user = nil
                    }
                    
                } else {
                    
                    self.errorMessage = "No data received."
                    self.user = nil
                    
                }
                
            }
            
        }.resume()
        
    }
    
}
