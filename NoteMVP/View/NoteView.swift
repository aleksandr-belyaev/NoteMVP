//
//  NoteView.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteView: UIViewController {
    private var label: UILabel!
    private var textField: UITextField!
    var saveHandler: (() -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your note here"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Right here"
        
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
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
        
        self.label = label
        self.textField = textField
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        self.saveHandler?()
        print("noteView")
    }
    
    func getText() -> String? {
        if let text = self.textField.text {
            return text
        } else {
            return nil
        }
    }
}
