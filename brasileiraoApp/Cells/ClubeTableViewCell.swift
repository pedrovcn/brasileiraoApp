//
//  ClubeTableViewCell.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import UIKit

class ClubeTableViewCell: UITableViewCell {

    @IBOutlet weak var posicaoLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var escudoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
