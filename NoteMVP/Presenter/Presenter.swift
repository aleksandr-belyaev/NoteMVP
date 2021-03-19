//
//  Presenter.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import Foundation

class Presenter {
    private var noteListCV: NoteListCV
    private var noteView: NoteView
    private var data: [NoteModel]
    
    init(noteList: NoteListCV, noteView: NoteView) {
        let data = [NoteModel()]
        self.noteListCV = noteList
        self.noteView = noteView
        self.data = data
        
        self.noteView.saveHandler = { [weak self] in
            self?.saveNote()
        }
    }
    
    private func saveNote() {
        var note = NoteModel()
        if let text = noteView.getText() {
            note.noteText = text
            data.append(note)
            noteView.clearText()
            self.noteListCV.updateData(notes: data)
        }
    }
}
