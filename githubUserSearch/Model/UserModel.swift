//
//  UserModel.swift
//  githubUserSearch
//
//  Created by anupam mishra on 25/06/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let avatar_url: String
    let html_url: String
}

enum URLError : Error {
    case badURL
}




