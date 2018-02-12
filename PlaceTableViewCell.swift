//
//  PlaceTableViewCell.swift
//  ProjetParking
//
//  Created by quentin courvoisier on 11/02/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblAdresse: UILabel!
    
    @IBOutlet weak var lblPrix: UILabel!
    
    
    func update(adresse: String , prix: Double){
        lblAdresse.text = adresse
        lblPrix.text = String(prix)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
