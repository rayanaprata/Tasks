//
//  MainTasksTableViewController.swift
//  Tasks
//
//  Created by Rayana Prata Neves on 14/10/21.
//

import UIKit

let work = Category(name: "Work", color: UIColor.green)
let study = Category(name: "Study", color: UIColor.blue)
let tasks: [Task] = [
    Task(name: "Create presentation for tomorrow", date: Date(), category: work),
    Task(name: "Call Janice about the substitute", date: Date(), category: work),
    Task(name: "Study math for mt computer science class because it's too hard to understand Calculus and I need to study pretty hard to understand it!", date: Date(), category: study
        )
]

class MainTasksTableViewController: UITableViewController {

    private var dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
