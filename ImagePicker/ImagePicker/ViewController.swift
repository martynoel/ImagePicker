//
//  ViewController.swift
//  ImagePicker
//
//  Created by Mimi on 12/21/17.
//  Copyright © 2017 Mimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    let cameraOverlay = CameraOverlay()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.showsCameraControls = false
        imagePicker.cameraOverlayView = cameraOverlay
        cameraOverlay.isHidden = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromPhotoLibrary() {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButtonPressed() {
        takePhotoWithCamera()
    }
    
    @IBAction func choosePhotoButtonPressed() {
        choosePhotoFromPhotoLibrary()
    }
    
    // MARK: Image Picker Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
}
