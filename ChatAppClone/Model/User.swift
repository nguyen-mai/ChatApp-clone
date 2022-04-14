//
//  User.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/14.
//

import Foundation

struct User {
    var name: String
    var ava: String
    
    init(name: String, ava: String) {
        self.name = name
        self.ava = ava
    }
}

extension User {
    static func getDummyData() -> [User] {
        var users = [User]()
        for i in 1...30 {
            let index = Int.random(in: 1...3)
            let user = User(name: "User \(i)", ava: "ava\(index)")
            users.append(user)
        }
        return users
    }
}
