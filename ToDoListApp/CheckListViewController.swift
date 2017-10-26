//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Jonny Hork on 10/25/17.
//  Copyright © 2017 G62-Jonny Hork. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // this is where you customize the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        
        if (indexPath.row % 5 == 0) {
            label.text = "Walk the dog"
        } else if (indexPath.row % 5 == 1){
            label.text = "Brush my teeth"
        }else if (indexPath.row % 5 == 2){
            label.text = "Learn iOS Dev"
        }else if (indexPath.row % 5 == 3){
            label.text = "Soccer practice"
        }else if (indexPath.row % 5 == 4){
            label.text = "Eat Ice cream"
        }
        
        return cell
    }


}

