//
//  ProductCell.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/13/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//
import UIKit

class ProductCell: UITableViewCell {
    
    //-------------------
    // MARK: - UI Outlets
    //-------------------
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    //-----------------------
    // MARK: - Configure Cell
    //-----------------------
    func configureCellWith(product: Product) {
        
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
    }
}
