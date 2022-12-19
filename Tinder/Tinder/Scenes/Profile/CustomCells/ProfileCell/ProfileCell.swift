//
//  ProfileCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileCellView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameAgeLbl: UILabel!
    @IBOutlet weak var cityCountryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpBackground()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK: - IBActions
    @IBAction func settingsTapped(_ sender: UIButton) {
        postSettingsTappedNotification()
    }
    @IBAction func cameraTapped(_ sender: UIButton) {
        postCameraTappedNotification()
    }
    @IBAction func editTapped(_ sender: UIButton) {
        postEditingModeNotification()
    }
    
    //MARK: - Setup
    private func setUpBackground() {
        profileCellView.clipsToBounds = true
        profileCellView.layer.cornerRadius = 85
        profileCellView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    //MARK: - Settings Button Helper Funcs
    private func postSettingsTappedNotification() {
        NotificationCenter.default.post(name: Notification.Name(NotificationName._settings.rawValue), object: nil)
    }
    
    //MARK: - Camera Button Helper Funcs
    private func postCameraTappedNotification() {
        NotificationCenter.default.post(name: Notification.Name(NotificationName._camera.rawValue), object: nil)
    }
    
    //MARK: - Edit Button Helper Funcs
    private func postEditingModeNotification() {
        NotificationCenter.default.post(name: Notification.Name(NotificationName._edit.rawValue), object: nil)
    }
}
