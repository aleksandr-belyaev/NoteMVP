//
//  NoteListCell.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteListCell: UITableViewCell {
    
    func createCell(labelText: String) {
        self.textLabel?.text = labelText
    }
}
