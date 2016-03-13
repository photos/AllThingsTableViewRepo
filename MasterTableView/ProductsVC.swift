//
//  ProductsVC.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/13/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

import UIKit
import Social

class ProductsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //-------------------
    // MARK: - UI Outlets
    //-------------------
    @IBOutlet weak var productsTableView: UITableView!

    // This is a computed property, lazily instantiate because it holds a ton of data.
    // Whenever you call it, it will be instantiated
    lazy var tableProductLines: [ProductLine] = {
        return ProductLine.productLines()
    }()
    
    // create an array of boolean values as number of products animates and all will have a false starting value
    var productShown = [Bool](count: ProductLine.numberOfProducts, repeatedValue: false)
    
    //----------------------
    // MARK: - View Did Load
    //----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the row height dynamic
        productsTableView.estimatedRowHeight = productsTableView.rowHeight
        productsTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    //-------------------------
    // MARK: - View Will Appear
    //-------------------------
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        // reload data to show editing changes
        productsTableView.reloadData()
    }
   
    //------------------------------------
    // MARK: - Title for Header in Section
    //------------------------------------
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let productLineForSection = tableProductLines[section]
        return productLineForSection.nameOfProductLine
    }
    
    //-----------------------------------
    // MARK: - Cell for Row at Index Path
    //-----------------------------------
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // indexPath is which section and which row in the table
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        
        let productLine = tableProductLines[indexPath.section]
        let product = productLine.allProducts[indexPath.row]
        
        // Call configure cell method from the ProductCell class
        cell.configureCellWith(product)
        
        return cell
    }
    
    //---------------------------------------------
    // MARK: - Number of Rows in Section
    //         Number of Products in a Product Line
    //---------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let productLineForSection = tableProductLines[section]
        return productLineForSection.allProducts.count // return number of products for a section
    }
    
    //-----------------------------------------
    // MARK: - Number of Sections in Table View
    //         Number of Product Lines
    //-----------------------------------------
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return tableProductLines.count
    }
    
    //-------------------------------
    // MARK: - Edit Row in Table View
    //-------------------------------
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // remove product at a certain row of a section
            let productLine = tableProductLines[indexPath.section]
            productLine.allProducts.removeAtIndex(indexPath.row)
            
            // update tableView with new data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    //--------------------------------
    // MARK: - Will Display Cell
    //         Animate Table View Cell
    //--------------------------------
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // if we havent seen the cell, perform animation
        if productShown[indexPath.row] == false {
            
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            
            cell.layer.transform = rotationTransform
            
            UIView.animateWithDuration(1.0, delay: 0, options: .CurveEaseOut, animations: {
                
                // rotate back to original position
                cell.layer.transform = CATransform3DIdentity
                
            }, completion: nil)
            
            productShown[indexPath.row] = true
        }
    }

    //----------------------------------------------
    // MARK: - Prepare for Segue
    //         Passing data from one view to another
    //----------------------------------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            
            switch identifier {
                
                case "goToDetailVC":
                    let detailVC = segue.destinationViewController as! ProductDetailVC
                    // access the product through the indexPath
                    // prepareForSegue is passed with the "sender" which is something we can pass in!
                    // the tableview passes in the cell as the "sender"
                    if let indexPath = self.productsTableView.indexPathForCell(sender as! UITableViewCell) {
                        // find product at that particular indexPath
                        detailVC.product = productAtIndexPath(indexPath)
                    }
                
                case "goToEditVC":
                    let editTableVC = segue.destinationViewController as! EditTableVC
                    // access the product through the indexPath
                    // prepareForSegue is passed with the "sender" which is something we can pass in!
                    // the tableview passes in the cell as the "sender"
                    if let indexPath = self.productsTableView.indexPathForCell(sender as! UITableViewCell) {
                        // find product at that particular indexPath
                        editTableVC.product = productAtIndexPath(indexPath)
                    }
                
                default: break
            }
        }
    }
    
    //------------------------------------------
    // MARK: - Table View Cell Swipe Row Actions
    //------------------------------------------
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // what you will share
        let product = tableProductLines[indexPath.section].allProducts[indexPath.row]
        let productTitle = product.title
        let initialText = "\(productTitle) - "
        let image = product.image
        
        let shareAction = UITableViewRowAction(style: .Default, title: "Share"){
            (action, indexPath) -> Void in
            
            let shareActionSheet = UIAlertController(title: "Share with", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default) { (action) in
                
                // check if use already installed their twitter account
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
                    
                    let tweetComposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    // set the initial text and image
                    tweetComposer.setInitialText(initialText)
                    tweetComposer.addImage(image)
                    
                    self.presentViewController(tweetComposer, animated: true, completion: nil)
                } else { // isn't registered on twitter
                    self.showAlert("Twitter Unavailable", message: "Please set up your Twitter in Settings to share this with your friends")
                }
            }
            
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default) { (action) in
                
                // check if use already installed their twitter account
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
                    
                    let facebookComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                    // set the initial text and image
                    facebookComposer.setInitialText(initialText)
                    facebookComposer.addImage(image)
                    
                    self.presentViewController(facebookComposer, animated: true, completion: nil)
                } else { // isn't registered on facebook
                    self.showAlert("Facebook Unavailable", message: "Please set up your Facebook in Settings to share this with your friends")
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareActionSheet.addAction(twitterAction)
            shareActionSheet.addAction(facebookAction)
            shareActionSheet.addAction(cancelAction)
            
            self.presentViewController(shareActionSheet, animated: true, completion: nil)
        }
        
        // have to remake a delete action
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete") { (action, indexPath) -> Void in
        
            let productLine = self.tableProductLines[indexPath.section]
            productLine.allProducts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
        shareAction.backgroundColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    //-------------------
    // MARK: - Show Alert
    //-------------------
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Got it.", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    //--------------------------------------------
    // MARK: - Product at Index Path Helper Method
    //--------------------------------------------
    func productAtIndexPath(indexPath: NSIndexPath) -> Product {
        let productLine = tableProductLines[indexPath.section]
        return productLine.allProducts[indexPath.row]
    }
}
