//
//  ToDoItemDetailViewController.swift
//  lesson 4
//
//  Created by anhdv on 10/16/21.
//

import UIKit

class ToDoItemDetailViewController: UIViewController {
    
    var completionHandler: ((ModelTask) -> Void)?
    var task: ModelTask?
    
    @IBOutlet weak var toDoContentView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBAction func saveTask(_ sender: Any) {
        if let task = task {
            task.title = titleTextView.text
            task.content = contentTextView.text
            _ = completionHandler?(task)
        } else {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYMMddhhmmss"

            
            let dateString = dateFormatter.string(from: date)
            
            let task = ModelTask()
            task.id = dateString
            task.title = titleTextView.text
            task.content = contentTextView.text
            _ = completionHandler?(task)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        toDoContentView.layer.masksToBounds = true
        
        if let task = task {
            self.titleTextView.text = task.title
            self.contentTextView.text = task.content
        } else {
            self.titleTextView.text = ""
            self.contentTextView.text = ""
        }
        
        
    }
    
}
