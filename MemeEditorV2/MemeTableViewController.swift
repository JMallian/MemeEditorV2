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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recent Memes"
    }
    
    @objc func addButtonTapped() {
        let controller: MemeEditorViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: delegate functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetail") as! MemeDetailViewController
        memeDetailViewController.memeImage = data[indexPath.row].memedImage
        self.navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
    // MARK: data source functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell") as! MemeTableViewCell
        
        cell.topLabel.text = data[indexPath.row].topText
        cell.bottomLabel.text = data[indexPath.row].bottomText
        cell.cellImage.image = data[indexPath.row].pic
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }
}

class MemeTableViewCell: UITableViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
}
