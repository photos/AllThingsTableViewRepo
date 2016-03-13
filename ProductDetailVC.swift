//
//  ProductDetailVC.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/13/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {

    //---------------------------
    // MARK: - Product Image View
    //---------------------------
    @IBOutlet weak var productImageView: UIImageView!
    
    // Model, optional because a product can be nil
    var product: Product?
    
    //----------------------
    // MARK: - View Did Load
    //----------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        productImageView.image = product?.image
    }
}
