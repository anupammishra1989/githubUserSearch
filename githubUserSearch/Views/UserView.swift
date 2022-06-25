//
//  UserView.swift
//  githubUserSearch
//
//  Created by anupam mishra on 25/06/22.
//

import SwiftUI

struct UserView: View {
    
    @Binding var user: User
    
    var body: some View {
        VStack {
            ZStack {   //load avatar
                AsyncImage(url: URL(string: user.avatar_url), scale: 1) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: { ProgressView().progressViewStyle(.circular) }
            }
            Spacer()
            Divider()
            VStack(alignment: .leading) {
                Text("Name: \(user.name)")
                    .font(.title2)
                    .bold()
                Text("Github link: \(user.html_url)")
                    .foregroundColor(.blue)
                    .underline()
                
            }
        }.padding()
            .frame(height: 80)
            .onTapGesture {
                //Open github page
                Utilities.openWebPage(from: user.html_url)
            }
            .onAppear {
                SearchHistoryVM.storeSearchHistory(user: user)
            }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: .constant(User(id: 1,
                                      name: "Anupam",
                                      avatar_url: "",
                                      html_url: "")))
    }
}
