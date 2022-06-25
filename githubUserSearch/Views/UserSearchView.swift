//
//  UserSearchView.swift
//  githubUserSearch
//
//  Created by anupam mishra on 24/06/22.
//

import SwiftUI

struct UserSearchView: View {
    
    @State var searchQuery = ""
    @StateObject var api = GithubUserApi()
    
    var body: some View {
        NavigationView {
            VStack {
                //Search box
                Text("Searching for github user: \(searchQuery)")
                    .searchable(text: $searchQuery)
                    .onChange(of: searchQuery) { value in
                        Task {
                            await api.fetchUser(searchQuery: searchQuery)
                        }
                    }
                    .navigationTitle("Github user search")
                Spacer ()
                VStack {
                    switch api.state {
                    case .idle: EmptyView()
                    case .loading: ProgressView()
                    case .loaded(let user):
                        UserView(user: .constant(user))
                        
                    case .failed(let error):
                        if error is DecodingError {
                            Text("")
                        } else {
                            Text("")
                        }
                    }
                }
                Spacer ()
            }
        }
    }
}

struct UserSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchView()
    }
}
