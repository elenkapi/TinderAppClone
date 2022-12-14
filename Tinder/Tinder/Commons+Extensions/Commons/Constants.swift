//
//  Constants.swift
//  Tinder
//
//  Created by Ellen_Kapii on 08.12.22.
//

import UIKit

//MARK: - For FirebaseUser userdictionary keys
public let kUSERID = "userID"
public let kUSERNAME = "username"
public let kEMAIL = "email"
public let kCITY = "city"
public let kCOUNTRY = "country"
public let kISMALE = "isMale"
public let kDATEOFBIRTH = "dateOfBirth"
public let kPROFFESION = "proffesion"
public let kJOBTITLE = "jobTitle"
public let kABOUT = "about"
public let kHEIGHT = "height"
public let kLOOKINGFOR = "lookingFor"
public let kAVATARLINK = "avatarLink"
public let kLIKEDUSERSIDS = "likedUsersIDs"
public let kIMAGELINKS = "imageLinks"
public let kREGISTRATIONDATE = "registrationDate"
public let kPUSHID = "pushID"

public let kCURRENTUSER = "currentUser"

//MARK: - Profile
enum SectionTitle: String {
    case aboutMe = "About Me"
    case workEdu = "My Work & Education"
    case basicInfo = "My Basic Info"
}

enum Placeholder: String {
    case addJob = "Add Job"
    case addEdu = "Add Education"
    case gender = "Gender"
    case city = "City"
    case country = "Country"
    case height = "Height"
    case lookingFor = "Looking for"
}

enum NumberOfRowsInSection: Int {
    case sec0 = 1
    case sec1 = 2
    case sec2 = 3
    case sec3 = 6
    case secDefault = 0
}

enum HeightForRow: CGFloat {
    case sec0 = 420
    case forTitle$TxtField = 60
    case sec1_1 = 150
    case secDefault = 50
}
