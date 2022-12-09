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
    
    init(dictionary: NSDictionary) {
        self.userID = dictionary[kUSERID] as? String ?? ""
        self.username = dictionary[kUSERNAME] as? String ?? ""
        self.email = dictionary[kEMAIL] as? String ?? ""
        self.city = dictionary[kCITY] as? String ?? ""
        self.isMale = dictionary[kISMALE] as? Bool ?? true
        self.avatarLink = dictionary[kAVATARLINK] as? String ?? ""
        self.country = dictionary[kCOUNTRY] as? String ?? ""
        self.proffesion = dictionary[kPROFFESION] as? String ?? ""
        self.jobTitle = dictionary[kJOBTITLE] as? String ?? ""
        self.about = dictionary[kABOUT] as? String ?? ""
        self.height = dictionary[kHEIGHT] as? Double ?? 0.0
        self.lookingFor = dictionary[kLOOKINGFOR] as? String ?? ""
        self.likedUsersIDs = dictionary[kLIKEDUSERSIDS] as? [String] ?? []
        self.imageLinks = dictionary[kIMAGELINKS] as? [String] ?? []
        
        if let date = dictionary[kDATEOFBIRTH] as? Timestamp {
            self.dateOfBirth = date.dateValue()
        } else {
            self.dateOfBirth = dictionary[kDATEOFBIRTH] as? Date ?? Date()
        }
    }
    //MARK: - Register User
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
    //MARK: - Login User
    static func loginUserWith(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error == nil {
                if authDataResult!.user.isEmailVerified {
                    FirebaseListener.shared.downloadCurrentUserFromFirebase(userID: authDataResult!.user.uid, email: email)
                    completion(error, true)
                } else {
                    print("Email not verified")
                    completion(error, false)
                }
            } else {
                completion(error,false)
            }
        }
    }
    //MARK: - Reset Password
    static func resetPasswordFor(email: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().currentUser?.reload(completion: { error in
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                completion(error)
            })
        })
    }

    //MARK: - Save user locally/firestore
    func saveUserLocally() {
        userDefaults.setValue(self.userDictionary as! [String:Any], forKey: kCURRENTUSER)
        userDefaults.synchronize()
    }
    
    func saveUserToFireStore() {
        firebaseReference(.User).document(self.userID).setData(self.userDictionary as! [String:Any]) { error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

