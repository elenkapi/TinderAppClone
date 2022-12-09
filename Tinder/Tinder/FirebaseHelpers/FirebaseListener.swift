//
//  FirebaseListener.swift
//  Tinder
//
//  Created by Ellen_Kapii on 09.12.22.
//

import Foundation
import Firebase

class FirebaseListener {
    static let shared = FirebaseListener()
    
    private let userDefaults = UserDefaults.standard
    private init() { }
    
    //MARK: - FirebaseUser
    func downloadCurrentUserFromFirebase(userID: String, email: String) {
        firebaseReference(.User).document(userID).getDocument { [self] (documentSnapshot, error) in
            guard let documentSnapshot = documentSnapshot else { return }
            if documentSnapshot.exists {
                FirebaseUser(dictionary: documentSnapshot.data()! as NSDictionary).saveUserLocally()
            } else {
                //First login
                if let user = userDefaults.object(forKey: kCURRENTUSER) {
                    FirebaseUser(dictionary: user as! NSDictionary).saveUserToFireStore()
                }
            }
        }
    }
}
