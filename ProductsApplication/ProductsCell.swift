//
//  ProductsCell.swift
//  ProductsApplication
//
//  Created by Burak Özdemir on 24.06.2024.
//

import UIKit

protocol CellProtocol
{
    func addToCartClicked(indexPath: IndexPath)
}

class ProductsCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func addToCartPressed(_ sender: UIButton)
    {
        cellProtocol?.addToCartClicked(indexPath: indexPath!)
    }
    
}
