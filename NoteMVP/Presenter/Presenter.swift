//
//  Presenter.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import Foundation

class Presenter {
    private var noteList: NoteListProtocol
    private var noteView: NoteViewProtocol
    private var mainView: MainViewProtocol
    private var data: [NoteModel]
    private var method: (() -> Void)?
    
    init(mainView: MainView, noteView: NoteView, method: @escaping () -> Void) {
        let data = [NoteModel]()
        self.mainView = mainView
        self.noteList = mainView.notesList
        self.noteView = noteView
        self.data = data
        self.method = method
        
        self.noteView.saveHandler = { [weak self] in
            self?.saveNote()
        }
        self.mainView.addButtonHandler = { [weak self] in
            self?.presentEmptyNoteView()
        }
        self.noteList.rowTappedHandler = { [weak self] index in
            self?.showNoteEditor(index: index)
        }
    }
    
    private func showNoteEditor(index: IndexPath) {
        noteView.setNoteIndex(index: index)
        noteView.setText(text: data[index.row].noteText)
        self.method?()
        
    }
    
    private func presentEmptyNoteView() {
        noteView.clearText()
        noteView.clearIndex()
        self.method?()
    }
    
    private func saveNote() {
        if let text = noteView.getText() {
            if text != "" {
                var note = NoteModel(noteText: text)
                if let noteIndex = noteView.getNoteIndex() {
                    note.noteIndex = noteIndex
                    data[noteIndex.row] = note
                } else {
                    data.append(note)
                }
                self.noteList.updateData(notes: data)
            }
        }
    }
}
