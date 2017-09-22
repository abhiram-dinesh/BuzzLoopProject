//
//  ColorsTableViewController.swift
//  BuzzLoopProject
//
//  Created by Abhiram Dinesh on 9/20/17.
//  Copyright © 2017 Abhiram Dinesh. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    //array of colors
    var colors : [Color] = []  {
        didSet {
            //reload table when colors array is set
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get color list
        Helper.getColors { (colors) in
            self.colors = colors
        }
        
        //hide any extra seperators
        tableView.tableFooterView = UIView()
    }


    // MARK: - Table view data source

    //set number of rows in the table to color count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    //display data in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "color_cell", for: indexPath) as! ColorTableViewCell
        
        //set color name and view background color
        cell.colorLabel.text = colors[indexPath.row].colorName
        cell.colorView.backgroundColor = colors[indexPath.row].color
        
        //display text if not nil
        if let text = colors[indexPath.row].text {
            cell.colorText.text = text
        }
        else {
            cell.colorText.text = ""
        }

        return cell
    }
    
    //segue to color detail page when row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "color_detail", sender: indexPath.row)
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "color_detail" {
            if let vc = segue.destination as? ColorDetailViewController  {
                if let index = sender as? Int {
                    //set color and row index in the destination controller
                    vc.color = colors[index]
                    vc.index = index
                }
                return
            }
        }
    }
    
    // MARK: - Unwind Segue
    
    @IBAction func unwindBack(segue : UIStoryboardSegue) {
        if let vc = segue.source as? ColorDetailViewController {
            
            let index = vc.index
            let text = vc.textField.text
            
            //update the text to the right table cell based on index
            colors[index!].text = text
            
            //reload table data
            tableView.reloadData()
        }
    }

}
