//
//  DetailViewController.swift
//  Cookery
//
//  Created by Bob Brand on 12/31/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Objects
    @IBOutlet var dishNameField: UITextField!
    @IBOutlet var categoryNameField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var recipeImageView: UIImageView!
    

    var item: Item! {
        didSet {
            navigationItem.title = item.dishName
        }
    }
    var imageStore: ImageStore!

    
    // MARK: - Actions
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
  
    // MARK: - UIViewController Functions and Util
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    } ()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dishNameField.text = item.dishName
        categoryNameField.text = item.dishCategory
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        // Get the item key
        let key = item.itemKey
        
        // Check the store to see if there is an image associated with the item
        // display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        recipeImageView.image = imageToDisplay
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Gracefully remove any keyboard
        view.endEditing(true)
        
        // "Save" changes to item
        item.dishName = dishNameField.text ?? ""
        item.dishCategory = categoryNameField.text ?? ""
    }
    
    // MARK: - Text Field Delegate Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - UIImagePickerControllerDelegate Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Get a picked image from the info dictionary
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // Store the image in the imageStore for the item's key
        imageStore.setImage(image, forKey: item.itemKey)
        
        // Put the image on the screen in the image view
        recipeImageView.image = image
        
        // Remove the image picker
        dismiss(animated: true, completion: nil)
    }
}
