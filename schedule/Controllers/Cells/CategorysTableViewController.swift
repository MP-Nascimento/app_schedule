//
//  CategorysTableViewController.swift
//  schedule
//
//  Created by Miguel Nascimento on 17/09/21.
//

import UIKit

class CategorysTableViewController: UITableViewController {
    let categories = CategoryRepostory.getCategories()
    
    var chosenCategory: ((Category) -> Void)? 

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ChooseCategoryCell", for:indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        self.chosenCategory!(category)
        self.navigationController?.popViewController(animated: true)
        
    }
}
