//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Jonny Hork on 10/25/17.
//  Copyright © 2017 G62-Jonny Hork. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    
    var items: [checklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [checklistItem]()
        
        let row0Item = checklistItem()
        row0Item.text = "walk the dog"
        row0Item.checked = false
        items.append(row0Item)
        
        let row1Item = checklistItem()
        row1Item.text = "brush teeth"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = checklistItem()
        row2Item.text = "learn iOS"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = checklistItem()
        row3Item.text = "this is silly"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = checklistItem()
        row4Item.text = "Clean room"
        row4Item.checked = false
        items.append(row4Item)
        
        let row5Item = checklistItem()
        row5Item.text = "sleep"
        row5Item.checked = false
        items.append(row5Item)
        
        let row6Item = checklistItem()
        row6Item.text = "breakfast"
        row6Item.checked = false
        items.append(row6Item)
        
        let row7Item = checklistItem()
        row7Item.text = "dinner"
        row7Item.checked = false
        items.append(row7Item)
        
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @IBAction func addItem(){
        let newRowIndex = items.count
        let newItem = checklistItem()
        
        var titles = ["get a burrito", "Halloween costum", "meet jessie for lunch", "learn how to make AJAX calls with iOS", "get more sleep"]
        let randomNum = arc4random_uniform(UInt32(titles.count))
        let title = titles[Int(randomNum)]
        
        newItem.text = title
        newItem.checked = true
        items.append(newItem)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .left)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // this is where you customize the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem", for: indexPath)
        let item = items[indexPath.row]
        
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    func configureText(for cell: UITableViewCell, with item: checklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

    
    func configureCheckmark(for cell: UITableViewCell, with item: checklistItem){
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
    }
    


}

