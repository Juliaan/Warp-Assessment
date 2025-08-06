//
//  UserModel.swift
//  Warp-Assessment
//
//  Created by Juliaan Evenwel on 2025/08/06.
//

import Foundation

// our user model based on response from github
struct User: Decodable {
    let login: String
    let name: String?
    let bio: String?
    let avatarUrl: String // github property is in snake_case "avatar_url", will convert
    let publicRepos: Int // github property is in snake_case "public_repos", will convert
    let followers: Int
}
