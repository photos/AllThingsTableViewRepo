//
//  Product.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/13/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

import Foundation
import UIKit

// Represents a generic product. Need an image named "default"

class Product {
    
    var title: String
    var description: String
    var image: UIImage
    
    init(title: String, description: String, imageName: String) {
        
        self.title = title
        self.description = description
        
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "default")!
        }
    }
}