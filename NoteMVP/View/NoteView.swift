//
//  NoteView.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteView: UIViewController, NoteViewProtocol {
    var saveHandler: (() -> Void)?
    var dismissCompletionHandler: (() -> Void)?
    
    private var label: UILabel!
    private var textField: UITextField!
    private var noteIndex: IndexPath?
    
    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        
        createLabel()
        createTextField()
        createSaveButton()
    }
    
    private func createLabel() {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your note here"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        self.label = label
    }
    
    private func createTextField() {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Right here"
        
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        self.textField = textField
    }
    
    private func createSaveButton() {
        let saveButton = UIButton(frame: .zero)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .blue
        saveButton.setTitle("Save", for: .normal)
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            saveButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        self.saveHandler?()
        dismiss(animated: true, completion: nil)
    }
    
    func getText() -> String? {
        if let text = self.textField.text {
            return text
        } else {
            return nil
        }
    }
    
    func setText(text: String) {
        self.textField.text = text
    }
    
    func clearText() {
        if let _ = self.textField {
            self.textField.text = ""
        }
    }
    
    func setNoteIndex(index: IndexPath?) {
        self.noteIndex = index
    }
    
    func getNoteIndex() -> IndexPath? {
        if let index = self.noteIndex {
            return index
        } else {
            return nil
        }
    }
    
    func clearIndex() {
        if let _ = self.noteIndex {
            self.noteIndex = nil
        }
    }
}
