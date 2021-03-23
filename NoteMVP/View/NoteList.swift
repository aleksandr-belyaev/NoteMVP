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
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: "NoteListCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListCell", for: indexPath)
        if let note = self.notes?[indexPath.row] {
            cell.textLabel?.text = note.noteText
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.rowTappedHandler?(indexPath)
    }
    
    func updateData(notes: [NoteModel]) {
        self.notes = notes
        reloadData()
    }
    
}
