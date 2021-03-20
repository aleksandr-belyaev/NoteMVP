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
    private var mainView: MainView
    private var data: [NoteModel]
    private var method: (() -> Void)?
    
    init(mainView: MainView, noteView: NoteView, method: @escaping () -> Void) {
        let data = [NoteModel()]
        self.mainView = mainView
        self.noteListCV = mainView.notesList
        self.noteView = noteView
        self.data = data
        self.method = method
        
        self.noteView.saveHandler = { [weak self] in
            self?.saveNote()
        }
        self.mainView.addButtonHandler = { [weak self] in
            self?.presentEmptyNoteView()
        }
        self.noteListCV.rowTappedHandler = { [weak self] index in
            self?.showNoteEditor(index: index)
        }
    }
    
    private func showNoteEditor(index: IndexPath) {
        noteView.setNoteIndex(index: index)
        noteView.setText(text: data[index.row].noteText)
        self.method?()
    }
    
    func presentEmptyNoteView() {
        noteView.clearText()
        noteView.clearIndex()
        self.method?()
    }
    
    private func saveNote() {
        if let text = noteView.getText() {
            if text != "" {
                var note = NoteModel()
                note.noteText = text
                if let noteIndex = noteView.getNoteIndex() {
                    note.noteIndex = noteIndex
                    data[noteIndex.row] = note
                } else {
                    data.append(note)
                }
                noteView.clearText()
                self.noteListCV.updateData(notes: data)
            }
        }
    }
}
