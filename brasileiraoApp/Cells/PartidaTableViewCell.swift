//
//  PartidaTableViewCell.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 16/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import UIKit

class PartidaTableViewCell: UITableViewCell {

    @IBOutlet weak var clubeCasaImageView: UIImageView!
    @IBOutlet weak var clubeVisitanteImageView: UIImageView!
    @IBOutlet weak var clubeCasaAbreviacaoLabel: UILabel!
    @IBOutlet weak var clubeVisitanteAbreviacaoLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var dataHorarioLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
