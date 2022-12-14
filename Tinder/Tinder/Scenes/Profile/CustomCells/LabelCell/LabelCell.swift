//
//  LabelCell.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class LabelCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ userInfo: String) {
        self.titleLbl.text = userInfo
    }
}
