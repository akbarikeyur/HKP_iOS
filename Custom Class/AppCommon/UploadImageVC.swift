//
//  UploadImageVC.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class UploadImageVC: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgPicker.delegate = self
        
    }
    
    // MARK: - Upload Image
    /**
     *
     * This function is use for upload image.
     * User can select image from gallery or camera.
     * Using onCaptureImageThroughCamera function user can capture image through camera.
     * Using onCaptureImageThroughGallery function user can select image from gallery.
     * imagePickerController is delegate methode of image picker controller.
     *
     * @param
     */
    func uploadImage()
    {
        let actionSheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheet.addAction(cancelButton)
        
        let cameraButton = UIAlertAction(title: "Take Photo", style: .default)
        { _ in
            print("Camera")
            self.onCaptureImageThroughCamera()
        }
        actionSheet.addAction(cameraButton)
        
        let galleryButton = UIAlertAction(title: "Choose Existing Photo", style: .default)
        { _ in
            print("Gallery")
            self.onCaptureImageThroughGallery()
        }
        actionSheet.addAction(galleryButton)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @objc open func onCaptureImageThroughCamera()
    {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            displayToast("Your device has no camera")
            
        }
        else {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.allowsEditing = true
            imgPicker.sourceType = .camera
            UIViewController.top?.present(imgPicker, animated: true, completion: {() -> Void in
            })
        }
    }
    
    @objc open func onCaptureImageThroughGallery()
    {
        self.dismiss(animated: true, completion: nil)
        DispatchQueue.main.async {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.allowsEditing = true
            imgPicker.sourceType = .photoLibrary
            self.present(imgPicker, animated: true, completion: {() -> Void in
            })
        }
    }
    
    func selectedImage(choosenImage : UIImage) {
        
    }
    
    func imagePickerController(_ imgPicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgPicker.dismiss(animated: true, completion: {() -> Void in
        })
        
        if let choosenImage: UIImage? = (info["UIImagePickerControllerOriginalImage"] as? UIImage) {
            let croppedImage1 = compressImage(choosenImage!, to: CGSize(width: 800, height: 800))
            selectedImage(choosenImage: croppedImage1)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



