//
//  MainView.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class MainView: UIStackView {
    
    var addButtonHandler: (() -> Void)?
    
    private var header: UIStackView!
    var notesList: NoteListCV!
    
    init(method: @escaping () -> Void) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 10
        self.addButtonHandler = method
        
        createHeader()
        createNotesList()
        
        addArrangedSubview(self.header)
        addArrangedSubview(self.notesList)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createHeader() {
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
    
    func createNotesList() {
        let notesList = NoteListCV() { [weak self] in
            self?.addButtonHandler?()
        }
        notesList.translatesAutoresizingMaskIntoConstraints = false
        notesList.layoutIfNeeded()
        self.notesList = notesList
    }
    
    @objc func addButtonTapped(_ gesture: UIGestureRecognizer) {
        self.addButtonHandler?()
    }
}
