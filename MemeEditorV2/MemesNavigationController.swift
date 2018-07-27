//
//  MemesNavigationController.swift
//  MemeEditorV2
//
//  Created by Jessica Mallian on 7/27/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit
class MemesNavigationController: UINavigationController {

    // I guess this is not where you add this because it doesn't show up if put here - put it in MemeCollectionViewController and MemeTableViewController 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc func addButtonTapped() {
        //push MemeEditorViewController onto stack
    }
}
