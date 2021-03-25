//
//  NoteListCV.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteList: UITableView, UITableViewDataSource, UITableViewDelegate, NoteListProtocol  {
    
    private var notes: [NoteModel]?
    var rowTappedHandler: ((_: IndexPath) -> Void)?
    var rowDeleteHandler: ((_: IndexPath) -> Void)?
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
        register(NoteListCell.self, forCellReuseIdentifier: "NoteListCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let notes = self.notes {
            return notes.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListCell", for: indexPath) as! NoteListCell
        if let note = self.notes?[indexPath.row] {
            cell.createCell(labelText: note.noteText)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.rowTappedHandler?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.rowDeleteHandler?(indexPath)
        }
    }
    
    func updateData(notes: [NoteModel]) {
        self.notes = notes
        reloadData()
    }
    
}
