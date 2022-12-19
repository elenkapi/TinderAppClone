//
//  AboutMeCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class AboutMeCell: UITableViewCell {

    @IBOutlet weak var txtViewContainer: UIView!
    @IBOutlet weak var txtView: UITextView!
    
    private var editingMode = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        editBtnTapped()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Setup Functions
    private func setUp() {
        txtViewContainer.layer.cornerRadius = 7
        txtView.isUserInteractionEnabled = false
    }
    
    //MARK: - TextView Editing Mode
    private func editBtnTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(enableEditing), name: Notification.Name("Tinder.Notification.EditingMode"), object: nil)
    }
    
    @objc private func enableEditing() {
        editingMode.toggle()
        updateEditingMode()
    }
    
    private func updateEditingMode() {
        txtView.isUserInteractionEnabled = editingMode
    }
    
}
