//
//  AddItemTableViewController.swift
//  ToDoListApp
//
//  Created by Jonny Hork on 10/26/17.
//  Copyright © 2017 G62-Jonny Hork. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

      navigationItem.largeTitleDisplayMode = .never
      textField.delegate = self
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
        print("contents of texfield \(textField.text)")
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}
