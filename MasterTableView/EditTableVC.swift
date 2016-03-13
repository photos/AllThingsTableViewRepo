//
//  EditTableVC.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/14/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

import UIKit

class EditTableVC: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Model:
    var product: Product?
    
    //-------------------
    // MARK: - UI Outlets
    //-------------------
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    
    //----------------------
    // MARK: - View Did Load
    //----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        productDescriptionTextView.text = product?.description
    }
    
    //---------------------------------
    // MARK: - View Will Disappear
    //         Update and modified data
    //---------------------------------
    override func viewWillDisappear(animated: Bool) {
        
        product?.title = productTitleTextField.text!
        product?.description = productDescriptionTextView.text
        product?.image = productImageView.image!
    }
    
    //---------------------------------
    // MARK: - Text Field Should Return
    //---------------------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //-------------------------------
    // MARK: - UIScrollViewDelegate
    //         Use this for textviews
    //-------------------------------
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        resignFirstResponder()
    }
    
    //--------------------------------------
    // MARK: - Will Select Row at Index Path
    //         Select image
    //--------------------------------------
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        let imageIndex = 0
        
        if indexPath.section == imageIndex && indexPath.row == imageIndex {
            return indexPath
        } else {
            return nil
        }
    }
    
    //-------------------------------------
    // MARK: - Did Select Row at Index Path
    //         Image Picker Controller
    //-------------------------------------
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let imageIndex = 0
        
        if indexPath.section == imageIndex && indexPath.row == imageIndex {
            
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            picker.allowsEditing = false
            picker.delegate = self // present uiimagepicker on this view
            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    //---------------------------------
    // MARK: - Did Finish Picking Image
    //---------------------------------
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        product?.image = image
        productImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}
