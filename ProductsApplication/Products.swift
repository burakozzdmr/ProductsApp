//
//  Products.swift
//  ProductsApplication
//
//  Created by Burak Özdemir on 24.06.2024.
//

import Foundation

class Products
{
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    
    init()
    {
        
    }
    
    init(id: Int, name: String, image: String, price: Int)
    {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
}
