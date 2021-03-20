//
//  NoteListCV.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteListCV: UITableView, UITableViewDataSource, UITableViewDelegate  {
    
    private var notes: [NoteModel]?
    private var presentMethodHandler: (() -> Void)?
    
    init(present: @escaping () -> Void) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(frame: .zero, style: .plain)
        self.presentMethodHandler = present
        
        delegate = self
        dataSource = self
        register(NoteListCell.self, forCellReuseIdentifier: "NoteListCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notes != nil {
            return notes!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListCell", for: indexPath) as! NoteListCell
        if let note = notes?[indexPath.row] {
            cell.createCell(labelText: note.noteText)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presentMethodHandler?()
    }
    
    func updateData(notes: [NoteModel]) {
        self.notes = notes
        self.reloadData()
    }

}
