//
//  ViewController.swift
//  lesson 4
//
//  Created by anhdv on 10/16/21.
//

import UIKit

var listToDo : [ModelTask] = []
class ViewController: UIViewController {

    @IBOutlet weak var addToDoButton: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!
    
   
    
    
    @IBAction func addToDo(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let toDoDetailVC = storyBoard.instantiateViewController(identifier: "ToDoItemDetailViewController") as ToDoItemDetailViewController
        toDoDetailVC.completionHandler = { task in

            print("text = \(task.title) and \(task.content)")
            
            listToDo.append(task)
            self.tableview.reloadData()
            return
        }
        navigationController?.pushViewController(toDoDetailVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "My tasks"
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
        
        
        
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if listToDo.count == 0{
            let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
            emptyLabel.text = "No data"
            emptyLabel.textAlignment = NSTextAlignment.center
            tableview.backgroundView = emptyLabel
            tableview.separatorStyle = .none
            return 0
        } else {
            tableview.backgroundView = nil
            return listToDo.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        
        
        cell.titleLabel.text = listToDo[indexPath.row].title
        cell.contentLabel.text = listToDo[indexPath.row].content

        cell.updateTaskButton.tag = (indexPath.section*100) + indexPath.row
        cell.deleteTaskButton.tag = (indexPath.section*100) + indexPath.row
        
        cell.updateTaskButton.addTarget(self, action: #selector(self.updateTask), for: .touchUpInside)
        cell.deleteTaskButton.addTarget(self, action: #selector(self.deleteTask), for: .touchUpInside)
        return cell
    }
    
    @objc func updateTask(sender : UIButton) {
        let section = sender.tag / 100
        let row = sender.tag % 100
        let indexPath = NSIndexPath(row: row, section: section)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let toDoDetailVC = storyBoard.instantiateViewController(identifier: "ToDoItemDetailViewController") as ToDoItemDetailViewController
        toDoDetailVC.task = listToDo[indexPath.row]
        
        toDoDetailVC.completionHandler = { task in

            print("text = \(task.title) and \(task.content)")
            
            listToDo.remove(at: indexPath.row)
            listToDo.append(task)
            self.tableview.reloadData()
            return
        }
        navigationController?.pushViewController(toDoDetailVC, animated: true)
    }
    
    @objc func deleteTask(sender : UIButton) {
        let section = sender.tag / 100
        let row = sender.tag % 100
        let indexPath = NSIndexPath(row: row, section: section)
        listToDo.remove(at: indexPath.row)
        self.tableview.reloadData()
    }
    
}
