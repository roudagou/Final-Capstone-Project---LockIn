//
//  TaskViewController.swift
//  LockIn
//
//  Created by Roua Dagoushin on 8/6/25.
//
import UIKit

class TasksViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func addTask(_ sender: UIButton) {
        guard let task = taskInput.text, !task.isEmpty else { return }
        tasks.append(task)
        taskInput.text = ""
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") ?? UITableViewCell(style: .default, reuseIdentifier: "TaskCell")
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}

