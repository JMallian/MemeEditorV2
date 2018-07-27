//
//  MemeTableViewController.swift
//  MemeEditorV2
//
//  Created by Jessica Mallian on 7/26/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    // MARK: properties
    var data: [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memeArray
    }
    
    // MARK: delegate properties
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    // MARK: data source properties
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

class MemeTableViewCell: UITableViewCell {
    
}
