//
//  MemeDetailViewController.swift
//  MemeEditorV2
//
//  Created by Jessica Mallian on 7/27/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {    
    
    @IBOutlet weak var imageViewForMeme: UIImageView!
    var memeImage: UIImage!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewForMeme.image = memeImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
