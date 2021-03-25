//
//  Protocols.swift
//  NoteMVP
//
//  Created by Александр Беляев on 20.03.2021.
//

import Foundation

protocol NoteListProtocol {
    var rowTappedHandler: ((_: IndexPath) -> Void)? { get set }
    var rowDeleteHandler: ((_: IndexPath) -> Void)? { get set }
    func updateData(notes: [NoteModel])
}

protocol NoteViewProtocol {
    var saveHandler: (() -> Void)? { get set }
    var dismissCompletionHandler: (() -> Void)? { get set }
    
    func getText() -> String?
    func setText(text: String)
    func clearText()
    func setNoteIndex(index: IndexPath?)
    func getNoteIndex() -> IndexPath?
    func clearIndex()
}

protocol MainViewProtocol {
    var addButtonHandler: (() -> Void)? { get set }
}
