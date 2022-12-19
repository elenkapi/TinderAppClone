//
//  TextFieldCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var txtField: UITextField!
    
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
        txtField.isUserInteractionEnabled = false
    }
    
    //MARK: - TextField Editing Mode
    private func editBtnTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(enableEditing), name: Notification.Name("Tinder.Notification.EditingMode"), object: nil)
    }
    
    @objc private func enableEditing() {
        editingMode.toggle()
        updateEditingMode()
    }
    
    private func updateEditingMode() {
        txtField.isUserInteractionEnabled = editingMode
    }
}
