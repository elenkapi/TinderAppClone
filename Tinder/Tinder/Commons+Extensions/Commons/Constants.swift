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

//MARK: - Profile TableView(Cells)
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

enum ProfileSection: Int, CaseIterable {
    case firstSection = 0
    case secondSection = 1
    case thirdSection = 2
    case forthSection = 3
}

enum NumberOfRowsInSection: Int {
    case sec1 = 1
    case sec2 = 2
    case sec3 = 3
    case sec4 = 6
    case secDefault = 0
}

enum HeightForRow: CGFloat {
    case firstSection = 420
    case forTitle$TxtField = 60
    case txtView = 150
    case secDefault = 50
}

//MARK: - Notification Center
enum NotificationName: String {
    case _settings = "Tinder.Notification.SettingsTapped"
    case _camera = "Tinder.Notification.CameraTapped"
    case _edit = "Tinder.Notification.EditTapped"
    case _save = "Tinder.Notification.SaveTapped"
}

enum AlertTitle: String {
    case _settings = "Edit Account"
    case _camera = "Upload Picture"
}

enum AlertMessage: String {
case _settings = "You are about to edit sensitive information about your account"
case _camera = "You can change your avatar or upload more pictures"
}

enum AlertOption: String {
    case changeEmail = "Change Email"
    case changeName = "Change Name"
    case logOut = "Log Out"
    case changeAvatar = "Change Avatar"
    case uploadPictures = "Upload Pictures"
    case cancel = "Cancel"
}
