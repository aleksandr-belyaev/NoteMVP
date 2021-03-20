//
//  NoteListCell.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteListCell: UITableViewCell {
    
    func createCell(labelText: String) {
        let cellLabel = UILabel(frame: .zero)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.text = labelText
        
        NSLayoutConstraint.activate([
            cellLabel.widthAnchor.constraint(equalToConstant: 150),
            cellLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        self.addSubview(cellLabel)
    }
}
