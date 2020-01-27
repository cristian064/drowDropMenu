//
//  CustomTableViewCell.swift
//  drowDropMenu
//
//  Created by cristian ayala on 1/26/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell , ConfigureCellProtocol {

    

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell<T>(data: T) {
        guard let data = data as? User else {
            return
        }
        titleLabel.text = data.name
    }

}
