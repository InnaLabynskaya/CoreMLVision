//
//  ViewController.swift
//  CoreMLVision
//
//  Created by Inna Kuts on 10/8/18.
//  Copyright © 2018 Inna Kuts. All rights reserved.
//

import UIKit
import Vision
import CoreML

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private var imagePicker = UIImagePickerController()
    
    private var model = GoogLeNetPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        self.photoImageView.image = pickedImage
        processImage(image: pickedImage)
    }
    
    @IBAction func openPhotoLibraryButtonPressed(_ sender: UIBarButtonItem) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    private func processImage(image: UIImage) {
        guard let visionModel = try? VNCoreMLModel(for: self.model.model) else {
            fatalError()
        }
        let visionRequest = VNCoreMLRequest(model: visionModel) { (request, error) in
            
        }
    }
}

