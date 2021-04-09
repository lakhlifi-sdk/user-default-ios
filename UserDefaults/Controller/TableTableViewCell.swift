//
//  TableTableViewCell.swift
//  UserDefaults
//
//  Created by Lakhlifi Essaddiq on 4/6/21.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
