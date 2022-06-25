//
//  SearchHistoryView.swift
//  githubUserSearch
//
//  Created by anupam mishra on 24/06/22.
//

import SwiftUI

struct SearchHistoryView: View {
    
    @State private var users: [User] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height: 20)
                ForEach (users, id: \ .id) { user in
                    VStack {
                        CellView(user: .constant(user))
                    }.padding(.top, 10)
                        .padding(.bottom, 10)
                    Divider()
                }
            }
            .navigationTitle("Search history")
            .toolbar {
                Button("Clear") {
                    SearchHistoryVM.setUsersInUserDefaults(users: [])
                    users = SearchHistoryVM.getUserFromUserDefaults()
                }
            }
            .onAppear {
                users = SearchHistoryVM.getUserFromUserDefaults()
            }
        }
        
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryView()
    }
}
