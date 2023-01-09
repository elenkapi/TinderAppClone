//
//  AboutMeCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class AboutMeCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var txtViewContainer: UIView!
    @IBOutlet weak var txtView: UITextView!
    
    //MARK: - Class Variables
    private var editingMode = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        editBtnTapped()
        saveBtnTapped()
    }
    
    //MARK: - Setup Functions
    private func setUp() {
        txtViewContainer.layer.cornerRadius = 7
        txtView.isUserInteractionEnabled = false
    }
    
    func configCell(_ userInfo: String) {
        self.txtView.text = userInfo != "" ? userInfo : "A little bit about me..."
    }
    
    //MARK: - TextView Editing Mode
    private func editBtnTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(enableEditing), name: Notification.Name(NotificationName._edit.rawValue), object: nil)
    }
    
    private func saveBtnTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(enableEditing), name: Notification.Name(NotificationName._save.rawValue), object: nil)
    }
    
    @objc private func enableEditing() {
        editingMode.toggle()
        updateEditingMode()
    }
    
    private func updateEditingMode() {
        txtView.isUserInteractionEnabled = editingMode
    }
    
}
