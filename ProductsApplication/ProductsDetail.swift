//
//  ProductsDetail.swift
//  ProductsApplication
//
//  Created by Burak Özdemir on 24.06.2024.
//

import UIKit

class ProductsDetail: UIViewController 
{
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: Products?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let safeProduct = product
        {
            self.navigationItem.title = safeProduct.name
            productImageView.image = UIImage(named: safeProduct.image!)
            productPriceLabel.text = "\(safeProduct.price!) ₺"
        }
    }
    
    
    @IBAction func addToCartPressed(_ sender: UIButton) 
    {
        if let safeProduct = product
        {
            print("Detail Page : \(safeProduct.name!) added to cart !")
        }
    }
}
