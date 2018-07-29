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
    
    //MARK: attritubtes for text fields
    let memeTextAttributes: [String: Any] = [
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedStringKey.strokeWidth.rawValue: -3
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //custimize text fields and set text field delegates
        setTextFieldAttributesAndDelegate(text: "BOTTOM", textField: bottomTextField)
        setTextFieldAttributesAndDelegate(text: "TOP", textField: topTextField)
    }
    
    func setTextFieldAttributesAndDelegate(text: String, textField: UITextField) {
        textField.defaultTextAttributes = memeTextAttributes
        textField.text = text
        textField.backgroundColor = .clear
        textField.autocapitalizationType = .allCharacters
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.delegate = self
    }




}

