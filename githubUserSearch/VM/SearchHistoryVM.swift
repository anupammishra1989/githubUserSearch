//
//  SearchHistoryVM.swift
//  githubUserSearch
//
//  Created by anupam mishra on 25/06/22.
//

import Foundation

class SearchHistoryVM {
    
   static func storeSearchHistory(user: User) {
        var users = getUserFromUserDefaults()
        if users.contains(where: { cacheUser in
            return cacheUser.id == user.id
        }) == false {
            users.append(user)
        }
        setUsersInUserDefaults(users: users)
    }
    
   static func setUsersInUserDefaults(users: [User]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Note
            let data = try encoder.encode(users)
            
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "users")
            
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
  static  func getUserFromUserDefaults() -> [User] {
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "users") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                let users = try decoder.decode([User].self, from: data)
                return users
                
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
            
        }
        return []
    }
}
