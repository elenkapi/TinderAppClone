//
//  FirebaseUser.swift
//  Tinder
//
//  Created by Ellen_Kapii on 07.12.22.
//

import UIKit
import Firebase

final class FirebaseUser: Equatable {
    private let userDefaults = UserDefaults.standard
    
    static func == (lhs: FirebaseUser, rhs: FirebaseUser) -> Bool {
        lhs.userID == rhs.userID
    }
    
    let userID: String
    var username: String
    var email: String
    var city: String
    var country: String
    var isMale: Bool
    var dateOfBirth: Date
    var avatar: UIImage?
    var proffesion: String
    var jobTitle: String
    var about: String
    var height: Double
    var lookingFor: String
    var avatarLink: String
    
    var likedUsersIDs: [String]?
    var imageLinks: [String]?
    var registrationDate = Date()
    var pushID: String?
    
    var userDictionary: NSDictionary {
        return NSDictionary(objects: [
            self.userID,
            self.username,
            self.email,
            self.city,
            self.country,
            self.isMale,
            self.dateOfBirth,
            self.proffesion,
            self.jobTitle,
            self.about,
            self.height,
            self.lookingFor,
            self.avatarLink,
            self.likedUsersIDs ?? [],
            self.imageLinks ?? [],
            self.registrationDate,
            self.pushID ?? ""
        ], forKeys: [
            kUSERID as NSCopying,
            kUSERNAME as NSCopying,
            kEMAIL as NSCopying,
            kCITY as NSCopying,
            kCOUNTRY as NSCopying,
            kISMALE as NSCopying,
            kDATEOFBIRTH as NSCopying,
            kPROFFESION as NSCopying,
            kJOBTITLE as NSCopying,
            kABOUT as NSCopying,
            kHEIGHT as NSCopying,
            kLOOKINGFOR as NSCopying,
            kAVATARLINK as NSCopying,
            kLIKEDUSERSIDS as NSCopying,
            kIMAGELINKS as NSCopying,
            kREGISTRATIONDATE as NSCopying,
            kPUSHID as NSCopying
        ])
    }
    
    
    //MARK: - Initializers
    init(userID: String, username: String, email: String, city: String, dateOfBirth: Date, isMale: Bool, avatarLink: String = "") {
        self.userID = userID
        self.username = username
        self.email = email
        self.city = city
        self.isMale = isMale
        self.dateOfBirth = dateOfBirth
        self.avatarLink = avatarLink
        self.country = ""
        self.proffesion = ""
        self.jobTitle = ""
        self.about = ""
        self.height = 0.0
        self.lookingFor = ""
        self.likedUsersIDs = []
        self.imageLinks = []
    }
    
    // MARK: - Register User
    static func registerUserWith(username: String, email: String, city: String, isMale: Bool, dateOfBirth: Date, password: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            completion(error)
            if error == nil {
                authDataResult!.user.sendEmailVerification(completion: { error in
                    print("Auth email verification sent", error?.localizedDescription as Any)
                })
            }
            if authDataResult?.user != nil {
                let user = FirebaseUser(userID: authDataResult!.user.uid, username: username, email: email, city: city, dateOfBirth: dateOfBirth, isMale: isMale)
                user.saveUserLocally()
            }
        }
    }
    
    //MARK: - Save user locally
    private func saveUserLocally() {
        userDefaults.setValue(self.userDictionary as! [String:Any], forKey: kCURRENTUSER)
        userDefaults.synchronize()
    }
}
