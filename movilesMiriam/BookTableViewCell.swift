//
//  BookTableViewCell.swift
//  movilesMiriam
//
//  Created by Arnold Norabuena on 6/10/23.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblPrecio: UILabel!
    
    @IBOutlet weak var imgImagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
