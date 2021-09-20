//
//  TasksTableViewController.swift
//  schedule
// 
//  Created by Miguel Nascimento on 13/09/21.
//

import UIKit
class TasksTableViewController: UITableViewController {
    private var dateFormatter: DateFormatter = DateFormatter()
    private var tasks: [Task] = [] 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tasks = TaskRespository.instance.geTask()
        self.tableView.reloadData()
 
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        
        dateFormatter.dateFormat = "HH:mm"
        cell.hourLabel.text = dateFormatter.string(from: task.date)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.dateLabel.text = dateFormatter.string(from: task.date)
        
        cell.categoryNameLabel.text = task.category.name
        cell.categoryView.backgroundColor = task.category.color
        cell.taskDescriptionLabel.text = task.name
        
        return cell
    }
}
