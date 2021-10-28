//
//  MainTasksTableViewController.swift
//  Tasks
//
//  Created by Rayana Prata Neves on 14/10/21.
//

import UIKit

class MainTasksTableViewController: UITableViewController {

    private var dateFormatter: DateFormatter = DateFormatter()
    private var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tasks = TaskRepository.instance.getTasks()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        
        dateFormatter.dateFormat = "HH:mm"
        cell.labelHour.text = dateFormatter.string(from: task.date)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.labelDate.text = dateFormatter.string(from: task.date)
        
        cell.labelCategory.text = task.category.name
        cell.viewCategory.backgroundColor = task.category.color
        cell.labelTaskDescription.text = task.name
        
        return cell
    }

}
