//
//  User.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/14.
//

import Foundation
import Alamofire

struct User: Codable {
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
        
        let request = AF.request("https://627333f7a6522e24ac441da7.mockapi.io/api/v1/friends")
            // 2
//            request.responseJSON { (data) in
//              print("Result:\n \(data)")
//            }
        request.responseDecodable(of: User.self) { response in
            guard let user = response.value else { return }
            users.append(user)
        }
        print("Users: \(users)")
        
        for i in 1...30 {
            let index = Int.random(in: 1...3)
            let user = User(name: "User \(i)", ava: "avatar \(index)")
            users.append(user)
        }
        return users
    }
}
