//
//  ToDoTableViewCell.swift
//  lesson 4
//
//  Created by anhdv on 10/16/21.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var updateTaskButton: UIButton!
    @IBOutlet weak var deleteTaskButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
