//
//  TextFieldCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class TextFieldCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var txtField: UITextField!
    
    //MARK: - Class Variables
    private var editingMode = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        editBtnTapped()
    }
    
    //MARK: - Setup Functions
    private func setUp() {
        txtField.isUserInteractionEnabled = false
    }
    
    //MARK: - TextField Editing Mode
    private func editBtnTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(enableEditing), name: Notification.Name(NotificationName._edit.rawValue), object: nil)
    }
    
    @objc private func enableEditing() {
        editingMode.toggle()
        updateEditingMode()
    }
    
    private func updateEditingMode() {
        txtField.isUserInteractionEnabled = editingMode
    }
}
