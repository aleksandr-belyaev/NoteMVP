//
//  MainView.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class MainView: UIStackView, MainViewProtocol {
    
    var addButtonHandler: (() -> Void)?
    
    private var header: UIStackView!
    var notesList: NoteList!
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 10
        
        createHeader()
        createNotesList()
        
        addArrangedSubview(self.header)
        addArrangedSubview(self.notesList)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createHeader() {
        let header = UIStackView(frame: .zero)
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let label = UILabel(frame: .zero)
        label.text = "Notes"
        label.textColor = .black
        
        let button = UIButton(frame: .zero)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        header.addArrangedSubview(label)
        header.addArrangedSubview(button)
        self.header = header
    }
    
    private func createNotesList() {
        let notesList = NoteList()
        notesList.translatesAutoresizingMaskIntoConstraints = false
        notesList.layoutIfNeeded()
        self.notesList = notesList
    }
    
    @objc func addButtonTapped(_ gesture: UIGestureRecognizer) {
        self.addButtonHandler?()
    }
}
