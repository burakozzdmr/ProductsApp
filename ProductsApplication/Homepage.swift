//
//  ViewController.swift
//  ProductsApplication
//
//  Created by Burak Özdemir on 24.06.2024.
//

import UIKit

class Homepage: UIViewController 
{

    @IBOutlet weak var productTableView: UITableView!
    
    let productsList: [Products] =
    [
        Products(id: 1, name: "MacBook Pro 14", image: "laptop", price: 43000),
        Products(id: 2, name: "Rayban Club Master", image: "glasses", price: 2500),
        Products(id: 3, name: "Sony ZX Series", image: "headphone", price: 40000),
        Products(id: 4, name: "Gio Armani", image: "parfum", price: 2000),
        Products(id: 5, name: "Casio X Series", image: "watch", price: 8000),
        Products(id: 6, name: "Dyson V8", image: "cleaner", price: 18000),
        Products(id: 7, name: "iPhone 13", image: "phone", price: 32000)
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension Homepage: UITableViewDelegate, UITableViewDataSource, CellProtocol
{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let product = productsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as! ProductsCell
        
        cell.productImageView.image = UIImage(named: product.image!)
        cell.productName.text = product.name
        cell.productPrice.text = "\(product.price!) ₺" 
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackgroundView.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? 
    {
        let product = productsList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            contextualAction, view, bool in
            print("\(product.name!) deleted !")
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Configuration"){
            contextualAction, view, bool in
            print("\(product.name!) edited !")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        let product = productsList[indexPath.row]
        
        performSegue(withIdentifier: "productsToDetail", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
        if segue.identifier == "productsToDetail"
        {
            if let product = sender as? Products
            {
                let productsDetailVC = segue.destination as! ProductsDetail
                
                productsDetailVC.product = product
                
            }
        }
    }
    
    func addToCartClicked(indexPath: IndexPath) 
    {
        let product = productsList[indexPath.row]
        print("\(product.name!) added to cart !")
    }
}
