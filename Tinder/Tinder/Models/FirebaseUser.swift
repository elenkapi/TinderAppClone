//
//  FirebaseUser.swift
//  Tinder
//
//  Created by Ellen_Kapii on 07.12.22.
//

import Foundation
import Firebase

class FirebaseUser: Equatable {
    static func == (lhs: FirebaseUser, rhs: FirebaseUser) -> Bool {
        lhs.userID == rhs.userID
    }
    
    let userID: String = ""
    
    class func registerUserWith(email: String, password: String, username: String, city: String) {
        
    }
}
