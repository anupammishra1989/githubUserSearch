//
//  GithubUserApi.swift
//  githubUserSearch
//
//  Created by anupam mishra on 25/06/22.
//

import Foundation

class GithubUserApi: ObservableObject {
    enum LoadingState {
        case idle
        case loading
        case loaded(User)
        case failed(Error)
    }
    
    @Published var state: LoadingState = .idle
    
    func fetchUser(searchQuery: String?) async {
        
        guard let searchQuery = searchQuery,
              !searchQuery.isEmpty,
              let url = URL(string: "https://api.github.com/users/\(searchQuery)") else {
                  self.state = .failed(URLError.badURL)
                  return
              }
        self.state = .loading
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            if let jsonDecodable = try? JSONDecoder().decode(User.self, from: data) {
                DispatchQueue.main.async {
                    print(jsonDecodable)
                    self.state = .loaded(jsonDecodable)
                }
            }
        } catch {
            self.state = .failed(error)
            fatalError("Couldn't load data")
        }
    }
}
