//
//  HomeTabView.swift
//  githubUserSearch
//
//  Created by anupam mishra on 24/06/22.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            UserSearchView().tabItem {
                Label("Home", systemImage: "house")
            }
            SearchHistoryView().tabItem {
                Label("History", systemImage: "person.crop.circle")
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
