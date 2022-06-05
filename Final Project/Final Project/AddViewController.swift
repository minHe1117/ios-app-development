//
//  AddViewController.swift
//  Final Project
//
//  Created by mac on 3/13/22.
//

// Adding and Removing Functionality implmentation learn from:
// https://github.com/davidthorn/xcode-projects/blob/master/ImageSelectionApplication/ImageSelectionApplication/ViewController.swift //

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lipsPicture.contentMode = .scaleAspectFill
        self.addImageButton.isEnabled = self.selectedImage == nil
        self.addImageButton.alpha = 1
        
        brandPicker.dataSource = self
        brandPicker.delegate = self
        brandPicker.tag = 1
        brandField.inputView = brandPicker
        
        noPicker.dataSource = self
        noPicker.delegate = self
        noPicker.tag = 2
        noField.inputView = noPicker

        colorPicker.dataSource = self
        colorPicker.delegate = self
        colorPicker.tag = 5
        colorField.inputView = colorPicker
        

        // Do any additional setup after loading the view.
    }
    
   // let nameList = ["", "Scarlet Rouge", "Chérie", "Soleil", "Du Ciel", "Nubile", "Willful", "L'Amant", "L'Eclisse"]
    
    let brandList = ["", "YLS", "TOM FORD", "MAC", "ARMANI" ]
    
    let noList = ["", "111", "207", "404", "73", "999", "004", " 311", "098", "102"]
    
    let colorList = ["", "Deep Red", "White", "Brown",  "Purple", "Blue", "Green", "Orange", "Pink", "Red"]
    
    let brandPicker = UIPickerView()
    let colorPicker = UIPickerView()
    let noPicker = UIPickerView()
    let imagePicker = UIImagePickerController()
    
    var imagePickerController: UIImagePickerController?
    var defaultImageUrl: URL?
    
    
    @IBOutlet weak var lipsPicture: UIImageView!
    
   
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var brandField: UITextField!
    
    @IBOutlet weak var noField: UITextField!
    
    @IBOutlet weak var colorField: UITextField!
    
    @IBOutlet var totalFeild: [UITextField]!
    
    
    internal var selectedImage: UIImage? {
        get {
            return self.lipsPicture.image
        }
        
        set {
            switch newValue {
            case nil:
                self.lipsPicture.image = nil
                self.addImageButton.isEnabled = true
                self.addImageButton.alpha = 1
                
                self.removeButton.isEnabled = false
                self.removeButton.alpha = 0.5
            default:
                self.lipsPicture.image = newValue
                self.addImageButton.isEnabled = false
                self.addImageButton.alpha = 0.5
                
                self.removeButton.isEnabled = true
                self.removeButton.alpha = 1
            }
        }
    }
    
 
    @IBOutlet weak var addImageButton: UIButton!{
        didSet {
            guard let button = self.addImageButton else { return }
            button.isEnabled = true
            button.alpha = 1
        }
    }
    
    
    @IBOutlet weak var removeButton: UIButton!{
        didSet {
            guard let button = self.removeButton else { return }
            button.isEnabled = false
            button.alpha = 0.5
        }
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        if self.imagePickerController != nil {
            self.imagePickerController?.delegate = nil
            self.imagePickerController = nil
    }
        self.imagePickerController = UIImagePickerController.init()
        
        let alert = UIAlertController.init(title: "Source Type", message: nil, preferredStyle: .actionSheet)

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction.init(title: "Camera", style: .default, handler: { (_) in
                self.presentImagePicker(controller: self.imagePickerController!, source: .camera)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(UIAlertAction.init(title: "Photo Library", style: .default, handler: { (_) in
                self.presentImagePicker(controller: self.imagePickerController!, source: .photoLibrary)
            }))
        }
        
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
//            alert.addAction(UIAlertAction.init(title: "Saved Albums", style: .default, handler: { (_) in
//                self.presentImagePicker(controller: self.imagePickerController!, source: .savedPhotosAlbum)
//            }))
//        }
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    internal func presentImagePicker(controller: UIImagePickerController , source: UIImagePickerController.SourceType) {
        controller.delegate = self
        controller.sourceType = source
        self.present(controller, animated: true)
    }
    
    @IBAction func removeAction(_ sender: UIButton) {
        self.selectedImage = nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView == brandPicker {
            return brandList.count
        }else if pickerView == noPicker {
             return noList.count
        }else if pickerView == colorPicker {
             return colorList.count
        }

       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == brandPicker {
            return brandList[row]
        }
        else if pickerView == noPicker {
             return noList[row]
        }

        else if pickerView == colorPicker {
             return colorList[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == brandPicker {
            brandField.text = brandList[row]
            self.view.endEditing(false)
        }
        else if pickerView == noPicker {
            noField.text = noList[row]
            self.view.endEditing(false)
        }
        else if pickerView == colorPicker {
            colorField.text = colorList[row]
            self.view.endEditing(false)
        }
    }
    
    
    @IBAction func enterButton(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func addButton(_ sender: Any) {
        var textFieldsCompleted: Bool = false
        
        for textField in totalFeild {
            if textField.text == "" {
                let title = "Empty Text Field"
                let alertMessage = "Please fill in all fields."
                let alertController =
                    UIAlertController(title: title,
                                      message: alertMessage,
                                      preferredStyle: .alert)

                let cancelAction =
                    UIAlertAction(title: "OK",
                                  style: .cancel,
                                  handler: nil)
                alertController.addAction(cancelAction)
                present(alertController,
                        animated: true,
                        completion: nil)
            }
            else {
                textFieldsCompleted = true
            }
        }
        
        if self.lipsPicture.image == nil {
            let title = "Empty Image"
            let alertMessage = "Please add an image."
            let alertController =
                UIAlertController(title: title,
                                  message: alertMessage,
                                  preferredStyle: .alert)

            let cancelAction =
                UIAlertAction(title: "OK",
                              style: .cancel,
                              handler: nil)
            alertController.addAction(cancelAction)
            present(alertController,
                    animated: true,
                    completion: nil)
        }
        
        if self.lipsPicture.image != nil && textFieldsCompleted == true {
            GlobalLipsObjectList.ObjectList.append(Lips(
                lipsPicture: lipsPicture.image!,
                nameField:nameField.text!,
                brandField: brandField.text!,
                noField: noField.text!,
                colorField: colorField.text!))
            
            let title = "Item Successfully Added"
            let alertMessage = "Lipstick Information saved."
            let alertController =
                UIAlertController(title: title,
                                  message: alertMessage,
                                  preferredStyle: .alert)

            let cancelAction =
                UIAlertAction(title: "OK",
                              style: .cancel,
                              handler: nil)
            alertController.addAction(cancelAction)
            present(alertController,
                    animated: true,
                    completion: nil)
        
            for tf in totalFeild {
                tf.text = ""
            }
            self.selectedImage = nil
        }

    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
    extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return self.imagePickerControllerDidCancel(picker)
            }
            
            self.selectedImage = image
            
            picker.dismiss(animated: true) {
                picker.delegate = nil
                self.imagePickerController = nil
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true) {
                picker.delegate = nil
                self.imagePickerController = nil
            }
        }

}
