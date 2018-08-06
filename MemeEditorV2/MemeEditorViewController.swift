//
//  ViewController.swift
//  MemeEditorV2
//
//  Created by Jessica Mallian on 7/26/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UITextFieldDelegate {

    // MARK: properties
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var takePictureButton: UIBarButtonItem!
    
    //MARK: attritubtes for text fields
    let memeTextAttributes: [String: Any] = [
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedStringKey.strokeWidth.rawValue: -3
    ]
    
    //MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //custimize text fields and set text field delegates
        setTextFieldAttributesAndDelegate(text: "BOTTOM", textField: bottomTextField)
        setTextFieldAttributesAndDelegate(text: "TOP", textField: topTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //takePictureButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        //wnat to know when keyboard will appear in order to move the view up so the appearance of the keyboard doesn't cover the bottom textfield
        subscribeToKeyboardNotifications()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    //MARK textfields and keyboard functions
    func setTextFieldAttributesAndDelegate(text: String, textField: UITextField) {
        textField.defaultTextAttributes = memeTextAttributes
        textField.text = text
        textField.backgroundColor = .clear
        textField.autocapitalizationType = .allCharacters
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.delegate = self
    }

    //keyboard will disappear if user hits Return key on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //default text will disappear when user starts to edit textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }

    //MARK: keyboard notification methods
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        //only want to move view if the bottom text field is being edited, not the top since the keyboard only blocks the bottom textfield
        if bottomTextField.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }


}

